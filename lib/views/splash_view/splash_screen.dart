import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_view_driver/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    ///todo:................................
    return Scaffold(
        body: Center(
      child: Container(
        height: 299,
        width: 300,
        color: Colors.transparent,
        child: Image.asset('assets/LOGOammbpng.png'),
      ),
      //"This is the splash screen"
    ));
  }
}
