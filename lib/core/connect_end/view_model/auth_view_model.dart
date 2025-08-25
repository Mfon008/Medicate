// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, strict_top_level_inference
import 'package:flutter/material.dart';
import 'package:medicate_app/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:stacked/stacked.dart';
import '../../app_assets/app_utils.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../model/login_entity_model.dart';
import '../repo/repo_impl.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;

  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  bool get isTogglePasswordConfirm => _isTogglePasswordConfirm;
  bool _isTogglePasswordConfirm = false;
  bool onToggleMic = false;

  LoginResponseModel? _loginResponseModel;
  LoginResponseModel? get loginResponseModel=> _loginResponseModel;

  AuthViewModel({this.context});

  void signIn(context, {LoginEntityModel? signInEntity}) async {
    try {
      _isLoading = true;
      _loginResponseModel = await runBusyFuture(
        repositoryImply.signIn(signInEntity!),
        throwException: true,
      );
      _isLoading = false;
      if(_loginResponseModel?.statusCode==201){
         await AppUtils.snackbar(context, message: 'Your login is successful.!');
      }
     
      // navigate.navigateTo(Routes.dashboard);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
