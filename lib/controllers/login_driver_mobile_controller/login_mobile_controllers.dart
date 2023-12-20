import 'package:ambrd_driver_app/models/auto_login_services_model.dart';
import 'package:ambrd_driver_app/services/account_service_forautologin.dart';
import 'package:ambrd_driver_app/views/otp_new_correct_view/otp_new_correct_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../services/api_provider.dart';
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
    final http.Response r = await ApiProvider.PhoneLoginApi(
      "${MobileOrEmail.text}",
    );

    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      await Get.to(() => OtpVerification());
      print("ACCOUNT ${r.body}");
      final accountData = messageFromJson(r.body);
      print("ACCOUNT ${accountData.toJson()}");
      await accountService.setAccountData(accountData);
      // Get.to(() => OtpVerification());
      ///todo: change on 4 dec 2023...Get.to(() => OTPPhone());
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
    if (value.length != 10) {
      return "Provide valid Phone number";
    }
    return null;
  }

  void checkMobileLogin() {
    if (MobileLoginFormKey.currentState!.validate()) {
      phoneemailApi();
    }
    MobileLoginFormKey.currentState!.save();
  }

  ///...............................

  // login() {
  //   getStorage.write("id", 1);
  //   getStorage.write("name", "prince Kumar");
  //   Get.offAllNamed(Routes.HOME);
  // }
}
