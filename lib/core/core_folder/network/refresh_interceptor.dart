import 'dart:async';

import 'package:dio/dio.dart';
import 'package:medicate_app/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:medicate_app/core/core_folder/app/app.logger.dart';
import 'package:medicate_app/core/core_folder/network/response_handler_class.dart';
import 'package:medicate_app/core/core_folder/network/url_path.dart';
import '../app/app.locator.dart';
import '../manager/shared_preference.dart';

/// Intercepts token-expired responses, refreshes once, retries all failed requests,
/// and never leaks "Token session expired" to the UI when refresh succeeds.
class RefreshInterceptor extends Interceptor with ResponseHandler {
  RefreshInterceptor({required this.authDio});

  final logger = getLogger('RefreshInterceptor');
  final session = locator<SharedPreferencesService>();

  // final ProviderRef ref;
  final Dio authDio;

  /// Messages that indicate access token expiry (backend may return 401 or 2xx with these).
  static const _tokenExpiredPhrases = [
    'token session expired',
    'token expired',
    'access token expired',
    'expired token',
    'please provide a token',
  ];

  /// Single refresh lock: only one refresh runs; others wait and then retry.
  Completer<bool>? _refreshCompleter;

  bool _isRefreshEndpoint(RequestOptions options) {
    return options.path.contains(UrlConfig.refresh_token);
  }

  /// Login (and similar unauthenticated) endpoints return 401 for wrong credentials,
  /// not for expired token. Skip refresh so the UI shows the actual error (e.g. "Invalid credentials").
  bool _isLoginEndpoint(RequestOptions options) {
    return options.path.contains(UrlConfig.sign_in);
  }

  /// Returns true if the response body indicates token expiry (so we should refresh, not pass to UI).
  bool _isTokenExpiredResponse(Response response) {
    final data = response.data;
    if (data == null) return false;
    String message = '';
    if (data is Map<String, dynamic>) {
      message = ('first error').toLowerCase();
    } else if (data is Map) {
      message = ('second   ').toLowerCase();
    }
    if (message.isEmpty) return false;
    return _tokenExpiredPhrases.any((p) => message.contains(p));
  }

  /// Intercept 2xx responses that contain "Token session expired" so we never pass them to UI.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_isRefreshEndpoint(response.requestOptions)) {
      return handler.next(response);
    }

    final status = response.statusCode ?? 0;
    if (status >= 200 && status < 300 && _isTokenExpiredResponse(response)) {
      logger.w(
        'Token-expired message in success body → treating as 401 for refresh',
      );

      final syntheticError = DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Token session expired (intercepted from response body)',
      );

      return handler.reject(syntheticError);
    }

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final status = err.response?.statusCode ?? 0;
    logger.w('onError → Status: $status | Path: ${err.requestOptions.path}');

    final resp = err.response;
    final isTokenExpired =
        status == 401 || (resp != null && _isTokenExpiredResponse(resp));
    final isLogin = _isLoginEndpoint(err.requestOptions);

    // Login 401 = wrong credentials; show error, do not show expired-token dialog.
    if (isLogin) {
      handler.next(err);
      return;
    }

    if (isTokenExpired && !_isRefreshEndpoint(err.requestOptions)) {
      logger.w('Token expired (401 or body) → handling refresh + retry');
      await _handleTokenExpired(err, handler);
    } else {
      handler.next(err);
    }
  }

  /// One refresh for all: wait for lock, then retry. Never propagate token-expired error to UI when retry will happen.
  Future<void> _handleTokenExpired(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final requestOptions = err.requestOptions;
    bool refreshSucceeded = false;

    try {
      if (_refreshCompleter != null) {
        logger.i('Refresh already in progress → waiting');
        refreshSucceeded = await _refreshCompleter!.future;
      } else {
        _refreshCompleter = Completer<bool>();
        refreshSucceeded = await _performRefresh();
        logger.i('Token refresh completed → Success: $refreshSucceeded');
        _refreshCompleter!.complete(refreshSucceeded);
        _refreshCompleter = null;
      }

      if (!refreshSucceeded) {
        _onRefreshFailed(err, handler);
        return;
      }

      final newAccess = session.authToken;
      // ignore: unnecessary_null_comparison
      if (newAccess == null || newAccess.isEmpty) {
        logger.e('No new access token after refresh → treat as refresh failed');
        _onRefreshFailed(err, handler);
        return;
      }

      logger.i('Retrying request → ${requestOptions.path}');
      final opts = Options(
        method: requestOptions.method,
        headers: {
          ...requestOptions.headers,
          'Authorization': 'Bearer $newAccess',
        },
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
        receiveTimeout: requestOptions.receiveTimeout,
        sendTimeout: requestOptions.sendTimeout,
      );

      final response = await authDio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: opts,
        cancelToken: requestOptions.cancelToken,
        onReceiveProgress: requestOptions.onReceiveProgress,
        onSendProgress: requestOptions.onSendProgress,
      );

      logger.i('Retry successful → ${response.statusCode}');
      handler.resolve(response);
    } catch (e, st) {
      logger.e('Error during retry', error: e, stackTrace: st);
      // Forward the retry error (e.g. 404 "Tag does not exist"), not the original 401
      if (e is DioException) {
        handler.next(e);
      } else {
        handler.next(
          DioException(
            requestOptions: requestOptions,
            error: e,
            stackTrace: st,
            type: DioExceptionType.unknown,
          ),
        );
      }
    }
  }

  /// Clear tokens, show re-login, and pass a session-expired error so UI does not show raw "Token session expired".
  void _onRefreshFailed(DioException err, ErrorInterceptorHandler handler) {
    // ref.read(tokenNotifierProvider.notifier).clear();
    handleExpiredToken();

    final sessionExpiredError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: 'Session expired. Please sign in again.',
    );
    handler.next(sessionExpiredError);
  }

  Future<bool> _performRefresh() async {
    final refreshToken = session.authRefreshToken;

    // ignore: unnecessary_null_comparison
    if (refreshToken == null || refreshToken.isEmpty) {
      logger.e('Refresh token missing → cannot refresh');
      return false;
    }

    // final deviceInfo = ref.read(setupNotifier);
    final options = Options(
      headers: {
        "Authorization": "Bearer ${session.authToken}",
        'Accept': 'application/json',
      },
    );

    try {
      Response response;
      try {
        response = await authDio.post(
          UrlConfig.refresh_token,
          data: {'refreshToken': refreshToken},
          options: options,
        );
      } on DioException catch (e) {
        final status = e.response?.statusCode;
        if (status == 404 || status == 405) {
          response = await authDio.post(
            UrlConfig.refresh_token,
            data: {'refreshToken': refreshToken},
            options: options,
          );
        } else {
          rethrow;
        }
      }

      logger.i('Refresh response received: ${response.statusCode}');

      final data = LoginResponseModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      final newAccess = data.data?.accessToken ?? '';
      final newRefresh = data.data?.refreshToken ?? '';

      if (newAccess.isNotEmpty) {
        logger.i('Refresh successful → New access token set');
        // ref.read(tokenNotifierProvider.notifier).setTokens(
        //       accessToken: newAccess,
        //       refreshToken: newRefresh,
        //     );
        session.authToken = newAccess;
        session.authRefreshToken = newRefresh;
        return true;
      }

      logger.e('Refresh failed → accessToken missing in response');
      return false;
    } catch (e) {
      logger.e('Refresh request threw an error: $e');
      return false;
    }
  }
}
