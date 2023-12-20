import 'package:ambrd_driver_app/controllers/splash_controller/splash_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //    Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    ///todo:................................
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: 299,
            width: 300,
            color: Colors.transparent,
            child: Image.asset('lib/assets/DriverPlaystore.png'),
          ),
          //"This is the splash screen"
        ));
  }
}
