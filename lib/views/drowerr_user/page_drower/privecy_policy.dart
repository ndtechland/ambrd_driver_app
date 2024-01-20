import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class privecy_policy extends StatefulWidget {
  const privecy_policy({Key? key}) : super(key: key);

  @override
  State<privecy_policy> createState() => _privecy_policyState();
}

class _privecy_policyState extends State<privecy_policy> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var isLastPage = await inAppWebViewController.canGoBack();
        if (isLastPage) {
          inAppWebViewController.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Privacy Policy'),
          backgroundColor: MyTheme.ambapp,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest:
                    URLRequest(url: Uri.parse("https://ambrd.in/privacy")),
                onWebViewCreated: (InAppWebViewController controller) {
                  inAppWebViewController = controller;
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1
                  ? Container(
                      child: LinearProgressIndicator(
                        value: _progress,
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
