// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/connect_end/view_model/auth_view_model.dart';
import '../../main.dart';

// ignore: must_be_immutable
class AcceleratePaymentViewHmoPlan extends StatefulWidget {
  String? url;
  String? planType;
  String? planTier;

  AcceleratePaymentViewHmoPlan({
    super.key,
    required this.url,
    required this.planType,
    required this.planTier,
  });

  @override
  State<AcceleratePaymentViewHmoPlan> createState() =>
      _AcceleratePaymentViewHmoPlanState();
}

class _AcceleratePaymentViewHmoPlanState
    extends State<AcceleratePaymentViewHmoPlan> {
  WebViewController? _controller;

  bool isTransationMade = false;

  void setupWebViewWithPlatform() {
    late final PlatformWebViewControllerCreationParams params;
    if (Platform.isIOS) {
      params = const PlatformWebViewControllerCreationParams();
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    final controller = WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {
            print("STARTED: $url");
            _handleCallback(url); // 👈 important for iOS
          },
          onPageFinished: (String url) {
            print("FINISHED: $url");
          },
          onWebResourceError: (WebResourceError error) {
            print("ERROR: ${error.description}");
          },
          onNavigationRequest: (NavigationRequest request) {
            print("NAVAL Navigation: ${request.url}");
            _handleCallback(request.url);

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url!));

    _controller = controller;
  }

  void _handleCallback(String url) {
    print("CHECKING URL: $url");

    if (!isTransationMade && url.contains("success") ||
        url.contains("status=successful") ||
        url.contains("callback") ||
        url.contains("BANK_TRANSFER")) {
      print("✅ PAYMENT SUCCESS");
      isTransationMade = true;
      Navigator.pop(context, 5);
      // navigate.back(result: 5);
      // setState(() {});

      // if (isTransationMade==true) {
      //   print('isTransationMade:::::$isTransationMade');
      //   Navigator.pop(context, 5); 
      // }

      // return success
    }

    if (url.contains("failed") || url.contains("status=failed")) {
      print("❌ PAYMENT FAILED");
    }
  }

  // void setupWebViewWithPlatform() {
  //   if (Platform.isAndroid) {
  //     _controller = WebViewController()
  //       ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //       ..setNavigationDelegate(
  //         NavigationDelegate(
  //           onProgress: (int progress) {
  //             // Update loading bar.
  //           },
  //           onPageStarted: (String url) {},
  //           onPageFinished: (String url) {},
  //           onHttpError: (HttpResponseError error) {},
  //           onWebResourceError: (WebResourceError error) {},
  //           onNavigationRequest: (NavigationRequest request) {
  //             if (request.url.startsWith(widget.url!)) {
  //               return NavigationDecision.prevent;
  //             }
  //             return NavigationDecision.navigate;
  //           },
  //         ),
  //       )
  //       ..loadRequest(Uri.parse(widget.url!));
  //   } else {
  //     _controller = WebViewController()..loadRequest(Uri.parse(widget.url!));
  //   }
  // }

  @override
  void initState() {
    setupWebViewWithPlatform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopControl,
      child: ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        onDispose: (viewModel) {},
        builder: (_, AuthViewModel model, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: TextView(
                text: 'Payment Screen',
                textStyle: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 15.4.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greygrey1,
                ),
              ),
              backgroundColor: AppColors.dashboard,
              actions: isTransationMade
                  ? [
                      GestureDetector(
                        onTap: () {
                          navigate.back(result: 5);
                          model.notifyListeners();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0.w),
                          child: TextView(
                            text: 'PROCEED TO SUBMIT',
                            textStyle: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary1,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : [],
            ),
            body: WebViewWidget(controller: _controller!),
          );
        },
      ),
    );
  }

  Future<bool> willPopControl() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: TextView(
              text: 'Do you want to exit the app',
              textAlign: TextAlign.center,
              fontSize: 18.0.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.red, // Text Color
                    ),
                    child: TextView(
                      text: 'No',
                      fontSize: 20.sp,
                      color: AppColors.red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () => exitApp(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.green, // Text Color
                    ),
                    child: TextView(
                      text: 'Yes',
                      fontSize: 20.sp,
                      color: AppColors.green,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )) ??
        false;
  }

  void exitApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
    });
  }
}
