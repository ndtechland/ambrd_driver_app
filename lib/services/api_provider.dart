import 'dart:convert';

import 'package:ambrd_driver_app/views/home_view/home_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static var baseUrl = 'https://api.gyros.farm/';
  // static String token = '';
//  static String Id = ''.toString();

  static OtpApi(var Otp, var MobileNo) async {
    var url = "https://jkroshini.com/api/Registration/OtpVerify";
    http.Response r = await http.post(
      Uri.parse(url),
      body: jsonEncode({"Otp": "$Otp", "MobileNo": "$MobileNo"}),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    print("OtpVerify${r.body}");
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  static PhoneEmailApi(var MobileNo) async {
    final String url = "https://jkroshini.com/api/registration/MobileOtp";
    http.Response r = await http.post(
      Uri.parse(
        url,
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: jsonEncode({"MobileNo": MobileNo}),
    );
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  // from here verify otp.........................................
  static verifyOTP(var MobileNo, var Otp) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    var url = "https://jkroshini.com/api/Registration/OtpVerify";
    http.Response r = await http.post(Uri.parse(url),
        headers: headers,
        /*{
          "content-type" : "application/json",
          "accept" : "application/json",
        },*/
        body: jsonEncode({
          'MobileNo': "MobileNo",
          'Otp': "Otp",
        }));
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else {
      Get.to(() => HomeScreen());
      // Get.snackbar('Error', 'Wrong Otp');
      return null;
    }
  }

  //add  technician........................................................
  static addTechnicianApi(var Name, var Mobile, var Address) async {
    try {
      var url = 'https://jkroshini.com/api/Technician/AddTechnician';
      http.Response r = await http.post(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "Name": Name,
          "Mobile": Mobile,
          "Address": Address,
        }),
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //add services
  static addServicesApi(
    String Name,
  ) async {
    try {
      var url = 'https://jkroshini.com/api/Product/AddProduct';
      http.Response r = await http.post(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "Name": Name,
        }),
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //Complaint List Open
  // static complaintListOpenApi() async {
  //   var url =
  //       'https://jkroshini.com/api/RegistrationComplain/GetComplainListOpen';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     if (r.statusCode == 200) {
  //       ComplaintListOpenModel complainListOpenModel =
  //           complaintListOpenModelFromJson(r.body);
  //       return complainListOpenModel;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  //Complaint List Close
  ///

  // Complain Register
  static ComplainRegister(
    var Name,
    var Mobile,
    var Address,
    var dropdownValue,
    var ProductId,
  ) async {
    Map map = {
      "Name": Name,
      "Mobile": Mobile,
      "Address": Address,
      "TypeOfServices": dropdownValue,
      "ProductId": ProductId,
    };
    final String url =
        "https://jkroshini.com/api/RegistrationComplain/AddComplain";
    http.Response r = await http.post(
      Uri.parse(
        url,
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(map),
    );
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
      print('response2: ${r.body.toString()}');
    } else {
      Get.snackbar('Error', r.body);
      print('response3: ${r.body.toString()}');
      return r;
    }
  }

  // Profile
  // static profileApi() async {
  //   var url =
  //       'https://jkroshini.com/api/Registration/GetProfile/sdafadsfdsaf3452345243';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     if (r.statusCode == 200) {
  //       Profile profile = profileFromJson(r.body);
  //       return profile;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  // signup register
  static registerApi(var Name, var Number, var ShopName, var Address,
      var AadharName, Servicetype, var Password, img) async {
    print('ApiimagePath: ${img.toString()}');
    try {
      var url = 'https://jkroshini.com/api/Registration/Registration';
      http.Response r = await http.post(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "Name": Name,
          "Number": Number,
          "ShopName": ShopName,
          "Address": Address,
          "AadharName": AadharName,
          "Servicetype": Servicetype,
          "Password": Password,
          "Image": img
        }),
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  ///...... banner Api
  // static SliderBannerApi() async {
  //   var url =
  //       'https://jkroshini.com/api/Registration/GetBanner/1'; //baseUrl + 'api/AdminApi/BannerImage';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     if (r.statusCode == 200) {
  //       SliderListModel sliderbanerlist = sliderListModelFromJson(r.body);
  //       print(
  //           'sliderBannerApi: ${sliderbanerlist.result?[0].image.toString()}');
  //       return sliderbanerlist;
  //     }
  //   } catch (error) {
  //     return;
  //   }
  // }

  // Registration List
  ///....
  // static RegistrationListApi() async {
  //   var url = 'https://jkroshini.com/api/Registration/GetRegistrationList';
  //   try {
  //     http.Response r = await http.get(Uri.parse(url));
  //     if (r.statusCode == 200) {
  //       RegistrationListModel registrationListModel =
  //           registrationListFromJson(r.body);
  //       print(
  //           'registrationListModel: ${registrationListModel.result?[0].name}');
  //       return registrationListModel;
  //     }
  //   } catch (error) {
  //     print('RegistrationListError : ${error}');
  //   }
  // }
}
