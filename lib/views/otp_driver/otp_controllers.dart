import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpTimerController3 extends GetxController {
  RxString elapsedTime = '02:00'.obs;
  int _start = 120;
  String result = '';

  // void VerifyotpApi(var phone) async {
  //   http.Response r = await ApiProvider.verifyotpApi(phone,result);
  //   print(phone);
  //   print(result);
  //   if(r.statusCode==200){
  //     //Get.to(()=>CreateNewPassword());
  //     //Get.offAll(()=>VerifyOtp());
  //     //Get.offAll(()=> BottomBarScreen(i: 0,));
  //   }
  // }
  String? otpValidator(value) {
    if (value.length == 0) {
      return 'Plese enter otp';
    } else {
      return null;
    }
  }

  checkValidation(var phone) {
    final isValidaton = otpKey.currentState!.validate();

    if (!isValidaton) {
      return;
    } else {
      //Get.to(()=>MyDashBoard());
      //Get.to(()=>LoginScreen());
      // VerifyotpApi(phone);
    }
  }

  GlobalKey<FormState> otpKey = GlobalKey<FormState>();
  List<TextEditingController> otp = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  late Timer _timer;
  String formatTime(int secs) {
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void onInit() {
    startTimer();

    super.onInit();
  }

  void otpdigits() {
    result = '';
    for (int i = 0; i < 4; i++) result += otp[i].text;
    print(result);
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start < 1) {
        timer.cancel();
        elapsedTime.value = '00:00';
      } else {
        _start = _start - 1;
        elapsedTime.value = formatTime(_start);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
