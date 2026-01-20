import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:medicate_app/main.dart';
import 'package:medicate_app/ui/widget/text.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/core_folder/app/app.router.dart';

// ignore: must_be_immutable
class AcceleratePaymentViewPharmacy extends StatefulWidget {
  String? url;

  AcceleratePaymentViewPharmacy({super.key, required this.url});

  @override
  State<AcceleratePaymentViewPharmacy> createState() => _AcceleratePaymentViewPharmacyState();
}

class _AcceleratePaymentViewPharmacyState extends State<AcceleratePaymentViewPharmacy> {
  WebViewController? _controller;

  @override
  void initState() {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            onTap: () => navigate.clearStackAndShow(
              Routes.pharmacyDashboard,
              arguments: PharmacyDashboardArguments(index: 1),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 10.0.w),
              child: TextView(
                text: 'DASHBOARD',
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
  }
}
