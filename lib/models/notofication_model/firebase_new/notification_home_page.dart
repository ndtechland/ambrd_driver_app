import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationHomee extends StatelessWidget {
  const NotificationHomee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('push notification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('${message}')],
        ),
      ),
    );
  }
}
