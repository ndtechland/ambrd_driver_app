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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Ambrd APP'),
            backgroundColor: Colors.cyan,
            centerTitle: true,
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest:
                    URLRequest(url: Uri.parse("https://www.google.com/")),
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
