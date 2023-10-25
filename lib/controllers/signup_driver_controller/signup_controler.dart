import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../services/api_provider.dart';
import '../../views/home_view/home_page.dart';
import '../../widget/circular_loader.dart';
import '../login_driver_mobile_controller/login_mobile_controllers.dart';

class SignUpController extends GetxController {
  LoginMobileController _loginMobileController =
      Get.put(LoginMobileController());
  final GlobalKey<FormState> SignupFormKey = GlobalKey<FormState>();

  var selectedDrowpdown = 'abc';
  List dropdownText = ['abc', 'def', 'ghi'];

  ///this is radio button function...
  var selectedService = ''.obs;
  //image picker
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  onChangeService(String service) {
    selectedService.value = service;
  }

  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController ShopName = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController state = TextEditingController();

  TextEditingController city = TextEditingController();

  TextEditingController AadharNo = TextEditingController();
  TextEditingController Password = TextEditingController();

  void signupApi() async {
    final bytes = File(selectedImagePath.value).readAsBytesSync();
    String img64 = base64Encode(bytes);
    print('Controolerimage64: ${img64}');

    CallLoader.loader();
    http.Response r = await ApiProvider.registerApi(
        Name.text,
        Phone.text,
        ShopName.text,
        Address.text,
        AadharNo.text,
        selectedService.value,
        Password.text,
        img64);
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar('Success', 'Registration SuccessFully');
      //  _loginMobileController.login();
      Get.to(() => HomeScreen());
    }
  }

  // image picker
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  @override
  void onInit() {
    super.onInit();
    Name;
    Phone;
    ShopName;
    Address;
    AadharNo;
    Password;
    state;
    city;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  String? validateName(String value) {
    if (value.length < 2) {
      return "Name should must be 2 characters";
    }
    return null;
  }

  String? validatemobile(String value) {
    if (value.length < 10) {
      return "Provide valid Phone";
    }
    return null;
  }

  String? validateShopname(String value) {
    if (value.length < 3) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length < 3) {
      return "provide valid address";
    }
    return null;
  }

  String? validateState(String value) {
    if (value.length < 1) {
      return "provide valid address";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.length < 1) {
      return "provide valid address";
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

  void checkLogin() {
    final isValid = SignupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    SignupFormKey.currentState!.save();
    signupApi();
  }
}
