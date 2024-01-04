import 'dart:async';
import 'dart:io';

import 'package:ambrd_driver_app/controllers/booking_request_list_controller.dart';
import 'package:ambrd_driver_app/controllers/driver_list_new.dart';
import 'package:ambrd_driver_app/services/account_service_forautologin.dart';
import 'package:ambrd_driver_app/views/firebase_notificationss/message_screen.dart';
import 'package:ambrd_driver_app/views/home_view/booking_list.dart';
import 'package:ambrd_driver_app/views/home_view/ongoing_ride.dart';
import 'package:ambrd_driver_app/widget/circular_loader.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_firebase_notifications/message_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NotificationServices {
  //initialising firebase message plugin
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //initialising firebase message plugin
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  DriverRequestListController _driverRequestListController =
      Get.put(DriverRequestListController());
  //UseracptrejectController _useracptrejectController =
  // Get.put(UseracptrejectController());

  ///_driverRequestListController.getDriverRequestList?
  // DoctorHistoryController _doctorHistoryController =
  //     Get.put(DoctorHistoryController());

  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  // NurseAppointmentNurseDetailController _nurseappointmentnursedetailController =
  //     Get.put(NurseAppointmentNurseDetailController());
  //
  // DoctorHomepageController _doctorHomepageController =
  //     Get.put(DoctorHomepageController());
  //
  // NurseHistoryController _nurseHistoryController =
  //     Get.put(NurseHistoryController());

  //function to initialise flutter local notification plugin to show notifications for android when app is active
  void initLocalNotifications(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@drawable/ic_launcher');
    //@drawable/ic_launcher
    ///todo oldlines : const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
      // handle interaction when app is active for android
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;

      if (kDebugMode) {
        print("notifications title:${notification!.title}");
        print("notifications body:${notification.body}");
        print('count:${android!.count}');
        print('data:${message.data.toString()}');
      }

      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotifications(context, message);
        showNotification(message);
      }
    });
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('user granted permission');
      }
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('user granted provisional permission');
      }
    } else {
      //appsetting.AppSettings.openNotificationSettings();
      if (kDebugMode) {
        print('user denied permission');
      }
    }
  }

  // function to show visible notification when app is active
  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        //Random.secure().nextInt(100000).toString();
        message.notification!.android!.channelId.toString(),
        message.notification!.android!.channelId.toString(),
        importance: Importance.max,
        showBadge: true,
        playSound: true,
        sound: const RawResourceAndroidNotificationSound('jetsons_doorbell'));

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: 'my channel description',
            importance: Importance.high,
            priority: Priority.high,
            playSound: true,
            ticker: 'ticker',
            icon: '@drawable/ic_launcher',
            sound: channel.sound
            //     sound: RawResourceAndroidNotificationSound('jetsons_doorbell')
            //  icon: largeIconPath
            );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
      );
    });
  }

  //function to get device token on which we will send the notifications
  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      if (kDebugMode) {
        print('refreshtoken');
      }
    });
  }

  //handle tap on notification when app is in background or terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    // when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) async {
    if (message.data['type'] == 'msj') {
      await Future.delayed(Duration(milliseconds: 200));
      //_driverRequestListController.acceptbookingdriverApi();
      //_driverRequestListController.update();
      await _driverRequestListController.driverRequestListApi();
      _driverRequestListController.onInit();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 100));
      CallLoader.hideLoader();
      accountService.getAccountData.then((accountData) {
        //CallLoader.loader();
        // nearlistdriverApi();
        Timer(
          const Duration(milliseconds: 300),
          () {
            print("dataa1${message.data['id']}");
            // nearlistdriverApi();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessageScreen(
                          id: message.data['id'],
                        )));
            // Get.to(MessageScreen(
            //   id: message.data['id'],
            // ));
            //Get.to((MapView));
            //postAmbulancerequestApi(markers);

            ///
          },
        );
        //CallLoader.hideLoader();
      });

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MessageScreen(
      //               id: message.data['id'],
      //             )));
    } else if (message.data['type'] == 'accept_case') {
      print("dataaaccept${message.data['id']}");
      //_useracptrejectController.driveracceptrejctlistApi();
      //_useracptrejectController.update();

      await Future.delayed(Duration(milliseconds: 200));
      _driverAcceptlistController.driveracceptuserDetailApi();
      _driverAcceptlistController.update();

      ///todo new....29....aug 2023...

      _driverAcceptlistController.refresh();
      _driverAcceptlistController.onInit();

      ///todo end new....29....aug 2023...

      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(milliseconds: 600),
          () {
            // nearlistdriverApi();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessageScreen2(
                          id: message.data['id'],
                        )));
            // Get.to(MessageScreen(
            //   id: message.data['id'],
            // ));
            //Get.to((MapView));
            //postAmbulancerequestApi(markers);

            ///
          },
        );
        CallLoader.hideLoader();
      });

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MessageScreen(
      //               id: message.data['id'],
      //             )));
    } else if (message.data['type'] == 'reject_case') {
      print("reject${message.data['id']}");
    } else if (message.data['type'] == 'cancel_case_doctor') {
      print("dataaacceptewew${message.data['id']}");
      //_useracptrejectController.driveracceptrejctlistApi();
      //_useracptrejectController.update();

      await Future.delayed(Duration(milliseconds: 200));
      // _doctorHomepageController.doctorAppoinmentDetail();
      //_doctorHomepageController.update();
      ///_doctorHistoryController.doctorListHospitalApi();
      ///_doctorHistoryController.onInit();
      ///_doctorHistoryController.update();
      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(milliseconds: 600),
          () {
            // nearlistdriverApi();
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => DoctorHistoryUser(
            //               id: message.data['id'],
            //             )));

            ///
          },
        );
        CallLoader.hideLoader();
      });
    } else if (message.data['type'] == 'cancel_case_nurse') {
      print("dataaacceptewew${message.data['id']}");
      //_useracptrejectController.driveracceptrejctlistApi();
      //_useracptrejectController.update();

      await Future.delayed(Duration(milliseconds: 200));
      // _nurseappointmentnursedetailController.nurseappointmentApi();
      // _nurseappointmentnursedetailController.update();
      //_nurseappointmentnursedetailController.onInit();
      ///
      ///_nurseHistoryController.nursehistoryApi();
      /// _nurseHistoryController.update();
      //                                                                                     //  .skillsListApi();
      //                                                                                     _nurseHistoryController.update();
      // CallLoader.loader();
      // await Future.delayed(
      //     Duration(milliseconds: 900));
      // CallLoader.hideLoader();
      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(milliseconds: 600),
          () {
            // nearlistdriverApi();
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => NurseHistoryUser(
            //               id: message.data['id'],
            //             )));

            ///
          },
        );
        CallLoader.hideLoader();
      });
    } else if (message.data['type'] == 'accept_case') {
      print("dataaaccept${message.data['id']}");
      await Future.delayed(Duration(milliseconds: 200));
      _driverAcceptlistController.driveracceptuserDetailApi();
      _driverAcceptlistController.update();
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 600),
          () {
            /// nearlistdriverApi();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MessageScreen2(
                          id: message.data['id'],
                        )));
            // Get.to(MessageScreen(
            //   id: message.data['id'],
            // ));
            //Get.to((MapView));
            //postAmbulancerequestApi(markers);

            ///
          },
        );
        CallLoader.hideLoader();
      });

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => MessageScreen(
      //               id: message.data['id'],
      //             )));
    } else if (message.data['type'] == 'comingride_case') {
      print("dataridecoming${message.data['id']}");
      await Future.delayed(Duration(milliseconds: 200));
      _driverAcceptlistController.driveracceptuserDetailApi();
      _driverAcceptlistController.update();
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 600),
          () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => OngoingRideTracking(
            //               id: message.data['id'],
            //             )));
            //postAmbulancerequestApi(markers);

            ///
          },
        );
        CallLoader.hideLoader();
      });
    }

    ///todo: accept payment.....

    else if (message.data['type'] == 'payment_case') {
      print("datauserpayment${message.data['id']}");
      await Future.delayed(Duration(milliseconds: 200));
      _driverAcceptlistController.driveracceptuserDetailApi();
      _driverAcceptlistController.update();
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 600),
          () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OngoingRideTracking(
                          id: message.data['id'],
                        )));
            //postAmbulancerequestApi(markers);

            ///
          },
        );
        CallLoader.hideLoader();
      });
    }
  }

  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
