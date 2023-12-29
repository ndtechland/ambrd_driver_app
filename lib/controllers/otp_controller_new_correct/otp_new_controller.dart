import 'package:ambrd_driver_app/controllers/booking_request_list_controller.dart';
import 'package:ambrd_driver_app/controllers/home_controllers.dart';
import 'package:ambrd_driver_app/controllers/login_driver_mobile_controller/login_mobile_controllers.dart';
import 'package:ambrd_driver_app/controllers/swith_toogle_controller/toogle_switch_controller.dart';
import 'package:ambrd_driver_app/models/auto_login_services_model.dart';
import 'package:ambrd_driver_app/services/account_service_forautologin.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpVerifyController extends GetxController {
  RxBool isLoading = true.obs;

  GlobalKey<FormState> mobileform = GlobalKey();

  ///todo: this is the login apis....controller...
  LoginMobileController _loginMobileController =
      Get.put(LoginMobileController());
  SwitchX tooglecontroller = Get.put(SwitchX());
  DriverRequestListController _driverRequestListController =
      Get.put(DriverRequestListController());

  HomeController _homePageController = Get.put(HomeController());

  ///todo: this is the nav controller....controller...
  NavController _navController = Get.put(NavController());

  //LoginMobileController loginMobileController = Get.find();

  ///this is the api call....

  void callOtpApi(String otp) async {
    http.Response r = await ApiProvider.verifyOTP(
        _loginMobileController.MobileOrEmail.text, otp);
    if (r.statusCode == 200) {
      print("ACCOUNT ${r.body}");
      final accountData = messageFromJson(r.body);
      print("ACCOUNT ${accountData.toJson()}");
      await accountService.setAccountData(accountData);
      //Get.to(() => DetailsProfile());
      await _homePageController.AllServicesApi();
      await _homePageController.sliderBannerApi();
      _homePageController.onInit();

      //await _homePageController.AllServicesApi();
      //await _homePageController.sliderBannerApi();
      await _driverRequestListController.driverRequestListApi();
      _driverRequestListController.onInit();
      tooglecontroller.ToogleStatusApi();

      _homePageController.onInit();
      await _navController.tabindex(0);

      await Get.to(() => BottomNavBar());
    }
  }

  String? validateMobile(value) {
    if (value == '') {
      return 'please enter your otp';
    }
    return null;
  }

  checkMobile() async {
    var isValidate = mobileform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      // callotpApi();
    }
    mobileform.currentState!.save();
  }
}
