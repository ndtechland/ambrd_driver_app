import 'dart:convert';
import 'dart:io';

import 'package:ambrd_driver_app/models/city_model.dart';
import 'package:ambrd_driver_app/models/state_models.dart';
import 'package:ambrd_driver_app/views/login_view_driver/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

//import 'package:get/get.dart';

import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';
//import '../login_mobile_controller/login_mobile_controllers.dart';

class SignUpController extends GetxController {
//  LoginMobileController _loginMobileController =
  // Get.put(LoginMobileController());
  final GlobalKey<FormState> SignupFormKey2 = GlobalKey<FormState>();

  ///todo: gender......
  final selectedgender = "".obs;

  ///todo:date of birth..................
  var selectedDate = DateTime.now().obs;
  var selectedDate2 = DateTime.now().obs;

  onChangeGender(String servicee) {
    selectedgender.value = servicee;
  }

  var selectedDrowpdown = 'abc';
  List dropdownText = ['abc', 'def', 'ghi'];

  ///this is radio button function......
  var selectedService = ''.obs;
  //image picker
  var selectedImagePath = ''.obs;
  var selectedImagePath2 = ''.obs;

  // var selectedImageSize = ''.obs;
  // var selectedImageSize2 = ''.obs;

  var selectedImagePath3 = ''.obs;
  var selectedImagePath4 = ''.obs;

  //var selectedImageSize3 = ''.obs;
  // var selectedImageSize4 = ''.obs;

  var selectedImagePath5 = ''.obs;
  var selectedImagePath6 = ''.obs;

  //var selectedImageSize5 = ''.obs;
  //var selectedImageSize6 = ''.obs;

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;

  ///.....
  List<StateModel> states = <StateModel>[];

  onChangeService(String service) {
    selectedService.value = service;
  }

  TextEditingController DriverName = TextEditingController();
  TextEditingController MobileNumber = TextEditingController();
  TextEditingController EmailId = TextEditingController();
  //TextEditingController StateMaster_Id = TextEditingController();
  //TextEditingController CityMaster_Id = TextEditingController();
  TextEditingController Location = TextEditingController();
  TextEditingController PinCode = TextEditingController();
  TextEditingController DlNumber = TextEditingController();
  TextEditingController PanNumbar = TextEditingController();
  TextEditingController charge = TextEditingController();
  TextEditingController PanImage = TextEditingController();
  TextEditingController PanImageBase64 = TextEditingController();
  TextEditingController DlImage = TextEditingController();
  TextEditingController DlImageBase64 = TextEditingController();
  TextEditingController DOB = TextEditingController();
  //TextEditingController Gender = TextEditingController();

  TextEditingController DlImage1 = TextEditingController();

  TextEditingController DlImage1Base64 = TextEditingController();

  TextEditingController DlValidity = TextEditingController();

  TextEditingController AadharImage = TextEditingController();

  TextEditingController AadharImageBase64 = TextEditingController();

  TextEditingController AadharImage2 = TextEditingController();

  TextEditingController AadharImage2Base64 = TextEditingController();

  TextEditingController DriverImage = TextEditingController();

  TextEditingController DriverImageBase64 = TextEditingController();

  TextEditingController AadharNumber = TextEditingController();

  ///....
  var name = '';
  var email = '';
  var state = '';
  var mobile = '';
  // var state = '';
  // var city = '';
  var address = '';
  var pin = '';
  //var dateofbirth = "";

  ///todo:state api...
  Future<void> getStateApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  ///todo: city api......

  Future<void> getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  void signupApi() async {
    final img64 =
        base64Encode(await File(selectedImagePath.value).readAsBytes());
    final img642 =
        base64Encode(await File(selectedImagePath2.value).readAsBytes());
    final img643 =
        base64Encode(await File(selectedImagePath3.value).readAsBytes());
    final img644 =
        base64Encode(await File(selectedImagePath4.value).readAsBytes());
    final img645 =
        base64Encode(await File(selectedImagePath5.value).readAsBytes());
    final img646 =
        base64Encode(await File(selectedImagePath6.value).readAsBytes());

    // final bytes = File(selectedImagePath.value).readAsBytesSync();
    // String img64 = base64Encode(bytes);
    // print('Controolerimage64: ${img64}');

    // final bytes2 = File(selectedImagePath2.value).readAsBytesSync();
    // String img642 = base64Encode(bytes2);
    // print('image642: ${img642}');

    // final bytes3 = File(selectedImagePath3.value).readAsBytesSync();
    // String img643 = base64Encode(bytes3);
    // print('image643: ${img643}');

    // final bytes4 = File(selectedImagePath4.value).readAsBytesSync();
    // String img644 = base64Encode(bytes4);
    // print('image644: ${img644}');

    //final image645 = File(selectedImagePath5.value).readAsBytes();
    //String img645 = base64Encode(bytes5);
    //print('image645: ${img645}');
    ///
    //
    // final bytes6 = File(selectedImagePath6.value).readAsBytesSync();
    // String img646 = base64Encode(bytes6);
    // print('image646: ${img646}');

    CallLoader.loader();
    http.Response r = await ApiProvider.DriverRegistrationApi(
      DriverName.text,
      MobileNumber.text,
      EmailId.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      Location.text,
      PinCode.text,
      PanNumbar.text,
      DlNumber.text,
      charge.text,
      selectedImagePath.value.split('/').last,
      img64,
      selectedImagePath2.value.split('/').last,
      img642,
      DOB.text,
      selectedgender.value,
      selectedImagePath3.value.split('/').last,
      img643,
      DlValidity.text,

      selectedImagePath4.value.split('/').last,
      img644,

      selectedImagePath5.value.split('/').last,
      img645,

      selectedImagePath6.value.split('/').last,
      img646,

      AadharNumber.text,

      ///  "Gender": "Female",
      //   "DlImage1": "login.png",
      //   "DlImage1Base64": "",
      //   "DlValidity": "2024-12-24",
      //   "AadharImage": "login.png",
      //   "AadharImageBase64": "",
      //   "AadharImage2": "login.png",
      //   "AadharImage2Base64": "",
      //   "DriverImage": "login.png",
      //   "DriverImageBase64": "",
      //   "AadharNumber": "234567897834"
    );
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      //Get.snackbar('Success', 'Registration SuccessFully');
      //  _loginMobileController.login();

      Get.offAll(() => LoginScreen());
    }
  }

  ///....

  //image picker 1
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      // selectedImageSize.value =
      //     ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         " Mb";
    } else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //image picker 2
  void getImage2(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    //getImage ke jageh picImage
    if (pickedFile != null) {
      selectedImagePath2.value = pickedFile.path;
      // selectedImageSize2.value =
      //     ((File(selectedImagePath2.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         " Mb";
    } else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //image picker 3
  void getImage3(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath3.value = pickedFile.path;
      // selectedImageSize3.value =
      //     ((File(selectedImagePath3.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         " Mb";
    } else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //image picker 4
  void getImage4(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath4.value = pickedFile.path;
      // selectedImageSize4.value =
      //     ((File(selectedImagePath4.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         " Mb";
    } else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //image picker 5
  void getImage5(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath5.value = pickedFile.path;
      // selectedImageSize5.value =
      //     ((File(selectedImagePath5.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         " Mb";
    } else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  //image picker 6
  void getImage6(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath6.value = pickedFile.path;
      // selectedImageSize6.value =
      //     ((File(selectedImagePath6.value)).lengthSync() / 1024 / 1024)
      //             .toStringAsFixed(2) +
      //         " Mb";
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
    DriverName;
    MobileNumber;
    EmailId;
    Location;
    PanNumbar;
    DlNumber;
    charge;
    PanImage;
    PanImageBase64;
    DlImage;
    DlImageBase64;
    DOB;
    //Gender;
    DlImage1;
    DlImage1Base64;
    DlValidity;
    AadharImage;
    AadharImageBase64;
    AadharImage2;
    AadharImage2Base64;
    DriverImage;
    DriverImageBase64;
    AadharNumber;

    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    DOB = TextEditingController();
    DOB.text = "YYY-MM-DD";
    DlValidity = TextEditingController();
    DlValidity.text = "YYY-MM-DD";
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
    if (value.length != 10) {
      return "Provide valid Phone";
    }
    return null;
  }

  String? validateShopname(String value) {
    if (value.length < 2) {
      return "Provide valid imput";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.length < 3) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length < 3) {
      return "provide valid Input";
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

  String? validatepan(String value) {
    if (value.length < 2) {
      return "provide valid Input";
    }
    return null;
  }

  String? validatedlno(String value) {
    if (value.length < 2) {
      return "provide valid Input";
    }
    return null;
  }

  String? validatepassword(String value) {
    if (value.length < 5) {
      return "Provide valid password";
    }
    return null;
  }

  ///todo: here from this the main thing to choose...

  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      DOB
        ..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: DOB.text.length, affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

  ///todo: here from this the main thing to choose...

  chooseDate2() async {
    DateTime? newpickedDate2 = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate2.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select Validity',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate2 != null) {
      selectedDate2.value = newpickedDate2;
      DlValidity
        ..text = DateFormat('yyyy-MM-d').format(selectedDate2.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: DlValidity.text.length, affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

  void checkSignupdriver() {
    if (SignupFormKey2.currentState!.validate()) {
      signupApi();
    }
    SignupFormKey2.currentState!.save();
  }
}
