import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';

class LiveDriverController extends GetxController {
  final GlobalKey<FormState> AddbankdetailFormKey2 = GlobalKey<FormState>();

  NavController _navController = Get.put(NavController());

  TextEditingController Lat = TextEditingController();
  TextEditingController Lang = TextEditingController();

  void UpdateLiveLocationApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.GoogleupdatedriverApi(
      Lat.text,
      Lang.text,
    );
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar('Success', 'Add bank SuccessFully');
      //_loginMobileController.login();

      _navController.tabindex(0);
      // _navController.changeTabIndex(0);

      Get.to(() => BottomNavBar());
    }
  }

  @override
  void onInit() {
    super.onInit();
    Lat;
    Lang;
    // dateofbirth = TextEditingController();
    // dateofbirth.text = "YYY-MM-DD";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  String? validateaccount(String value) {
    if (value.length < 2) {
      return "Provide valid account";
    }
    return null;
  }

  String? validateifsc(String value) {
    if (value.length < 3) {
      return "Provide valid ifsc";
    }
    return null;
  }

  String? validatebranch(String value) {
    if (value.length < 3) {
      return "Provide valid branch";
    }
    return null;
  }

  String? validateholder(String value) {
    if (value.length < 2) {
      return "provide valid name";
    }
    return null;
  }

  String? validmobile(String value) {
    if (value.length != 10) {
      return "provide valid number";
    }
    return null;
  }

  String? validaddress(String value) {
    if (value.length < 1) {
      return "provide valid address";
    }
    return null;
  }

  String? validbank(String value) {
    if (value.length < 1) {
      return "provide valid bank";
    }
    return null;
  }

  String? validateaadharcard(String value) {
    if (value.length < 12) {
      return "Provide valid aadhar";
    }
    return null;
  }

  String? validatepassword(String value) {
    if (value.length < 5) {
      return "Provide valid password";
    }
    return null;
  }

  void checkaddbankuser() {
    if (AddbankdetailFormKey2.currentState!.validate()) {
      UpdateLiveLocationApi();
    }
    AddbankdetailFormKey2.currentState!.save();
  }
}
