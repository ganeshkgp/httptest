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
  bool disableDefaultErrorPage = true;
  bool supportZoom = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InAppWebView(
        initialUrl: 'https://google.in',
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            debuggingEnabled: true,
            supportZoom: false,
            horizontalScrollBarEnabled: false,
          ),
          android: AndroidInAppWebViewOptions(
            forceDark: AndroidForceDark.FORCE_DARK_ON,
          ),
        ),
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
