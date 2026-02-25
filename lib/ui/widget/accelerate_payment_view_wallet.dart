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

// ignore: must_be_immutable
class AcceleratePaymentViewWallet extends StatefulWidget {
  String? url;

  AcceleratePaymentViewWallet({super.key, required this.url});

  @override
  State<AcceleratePaymentViewWallet> createState() =>
      _AcceleratePaymentViewWalletState();
}

class _AcceleratePaymentViewWalletState
    extends State<AcceleratePaymentViewWallet> {
  WebViewController? _controller;

  void setupWebViewWithPlatform() {
    if (Platform.isAndroid) {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // Update loading bar.
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onHttpError: (HttpResponseError error) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.startsWith(widget.url!)) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.url!));
    } else {
      _controller = WebViewController()..loadRequest(Uri.parse(widget.url!));
    }
  }

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
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0.w),
                    child: TextView(
                      text: 'BACK TO WALLET',
                      textStyle: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary1,
                      ),
                    ),
                  ),
                ),
              ],
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
