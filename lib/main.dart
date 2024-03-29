import 'dart:io';

import 'package:ambrd_driver_app/models/notofication_model/firebase_new/firebase_api.dart';
import 'package:ambrd_driver_app/views/splash_view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
//
// sendDate() {
//   print('princeeee');
// }

@pragma('vm:entry-point')
//const task = 'firstTask';
// Mandatory if the App is obfuscated or using Flutter 3.1+
///
// void callbackDispatcher() {
//   Workmanager().executeTask((taskname, inputData) {
//     switch (taskname) {
//       case 'firstTask':
//         sendDate();
//         break;
//       default:
//     }
//     //print("Native called background task: $taskname"); //simpleTask will be emitted here.
//     return Future.value(true);
//   });
// }

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  ///workmanaget...start..
  //WidgetsFlutterBinding.ensureInitialized();

  // await Workmanager().initialize(
  //     callbackDispatcher, // The top level function, aka callbackDispatcher
  //     isInDebugMode:
  //         true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  //     );
  //await Workmanager().registerOneOffTask("task-identifier", "simpleTask");

  ///workmanaget...end..
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  ///i created new class name is firebase api kumar prince extra its not needed
  // await FirebaseApi().initNotifications();
  FirebaseApi().initNotifications();

  ///HttpOverrides.global = MyHttpOverrides();
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    GetMaterialApp(
      title: "Application",
      // theme: ThemeData(useMaterial3: true),

      //initialRoute: AppPages.INITIAL,
      //getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }
