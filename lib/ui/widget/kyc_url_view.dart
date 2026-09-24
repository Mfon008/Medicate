import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicate_app/core/config/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ImageWebViewScreen extends StatefulWidget {
  final String imageUrl;

  const ImageWebViewScreen({super.key, required this.imageUrl});

  @override
  State<ImageWebViewScreen> createState() => _ImageWebViewScreenState();
}

class _ImageWebViewScreenState extends State<ImageWebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(_html(widget.imageUrl));
  }

  String _html(String url) {
    return '''
    <!DOCTYPE html>
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            margin: 0;
            background: black;
            display: flex;
            justify-content: center;
            align-items: center;
          }
          img {
            max-width: 100%;
            max-height: 100%;
          }
        </style>
      </head>
      <body>
        <img src="$url" />
      </body>
    </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("KYC File Preview")),
      body: SizedBox(
        height: double.infinity,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final String imageUrl;

  const WebViewScreen({super.key, required this.imageUrl});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(_html(widget.imageUrl));
  }

  String _html(String url) {
    return '''
    <!DOCTYPE html>
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
          body {
            margin: 0;
            background: black;
            display: flex;
            justify-content: center;
            align-items: center;
          }
          img {
            max-width: 100%;
            max-height: 100%;
          }
        </style>
      </head>
      <body>
        <img src="$url" />
      </body>
    </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24.sp,
            color: AppColors.reminder,
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
