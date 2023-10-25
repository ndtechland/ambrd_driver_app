import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../services/api_provider.dart';
import '../../views/otp_driver/otp_page.dart';
import '../../widget/circular_loader.dart';

//import '../splash_controller/splash_controllers.dart';

class LoginMobileController extends GetxController {
  final getStorage = GetStorage();
  RxBool isLoading = false.obs;
  final GlobalKey<FormState> MobileLoginFormKey =
      GlobalKey(debugLabel: "MobileLoginFormKey");
  TextEditingController MobileOrEmail = TextEditingController();

  //OtpTimerController _timeController = Get.put(OtpTimerController());

  void phoneemailApi() async {
    CallLoader.loader();
    final http.Response r = await ApiProvider.PhoneEmailApi(
      "${MobileOrEmail.text}",
    );

    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      // Get.to(() => OtpVerification());
      Get.to(() => OTPPhone());
    }
  }

  @override
  void onInit() {
    super.onInit();
    MobileOrEmail;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //MobileOrEmail.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  String? validatePhone(String value) {
    if (value.length < 1) {
      return "provide valid Id";
    }
    return null;
  }

  void checkMobileLogin() {
    if (MobileLoginFormKey.currentState!.validate()) {
      phoneemailApi();
    }
    MobileLoginFormKey.currentState!.save();
  }
  //
  // login() {
  //   getStorage.write("id", 1);
  //   getStorage.write("name", "prince Kumar");
  //   Get.offAllNamed(Routes.HOME);
  // }
}
