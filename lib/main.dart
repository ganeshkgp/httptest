import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppWebViewController webViewController;
  bool showErrorPage = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InAppWebView(
        initialUrl: 'https://google.com',
        onWebViewCreated: (InAppWebViewController controller) {
          webViewController = controller;
        },
        onLoadError: (InAppWebViewController controller, String url, int i,
            String s) async {
          webViewController.loadFile(assetFilePath: "assets/error.html");
        },
        onLoadHttpError: (InAppWebViewController controller, String url, int i,
            String s) async {
          webViewController.loadFile(assetFilePath: "assets/error.html");
        },
      ),
    );
  }
}
