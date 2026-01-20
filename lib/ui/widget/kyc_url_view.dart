import 'package:flutter/material.dart';
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
