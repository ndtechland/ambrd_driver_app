import 'dart:convert';

import 'package:ambrd_driver_app/models/notofication_model/firebase_new/notification_home_page.dart';

///import 'package:ambrd_appss/modules/firebase_notification_service/firebase_new/notification_home_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notification',
    description: 'This channel is used for implement notification',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();

  ///todo:for android
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    Get.to(NotificationHomee());
  }

  ///this is the function....
//   Future initLocalNotification() async {
//     ///const iOS = IOSInitializationSettings();
//     const android = AndroidInitializationSettings('@drawable/ic_launcher');
//     const settings = InitializationSettings(android: android, iOS: iOS);
//
//     await _localNotifications.initialize(
//       settings,
//       // onSelectNotification: (payload) {
//       //   final message = RemoteMessage.fromMap(jsonDecode(Payload!));
//       //   handleMessage(message);
//       // }
//     );
//   }

  ///todo: for ios..
  Future initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
          icon: '@drawable/ic_launcher',
        )),
        payload: jsonEncode(message.toMap()),
        //notificationDetails
      );
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCNToken = await _firebaseMessaging.getToken();
    print('Token: $fCNToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
