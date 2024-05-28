import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/core/services/remote/end_point.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ModalNota extends StatelessWidget {
  String notaUrl;
  ModalNota({super.key, required this.notaUrl});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            CircularProgressIndicator(
              backgroundColor: Colors.blue,
            );
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(notaUrl));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2 / 1.2,
            child: WebViewWidget(controller: controller),
          ),
        ),
      ),
    );
  }
}
