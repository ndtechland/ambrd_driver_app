import 'dart:convert';

import 'package:ambrd_driver_app/models/all_services_model.dart';
import 'package:ambrd_driver_app/models/banner_model.dart';
import 'package:ambrd_driver_app/models/booking_request_model.dart';
import 'package:ambrd_driver_app/models/city_model.dart';
import 'package:ambrd_driver_app/models/driver_acceptlist_model.dart';
import 'package:ambrd_driver_app/models/driver_booking_history_model.dart';
import 'package:ambrd_driver_app/models/driver_payment_history_model.dart';
import 'package:ambrd_driver_app/models/galarry_model.dart';
import 'package:ambrd_driver_app/models/get_bank_model.dart';
import 'package:ambrd_driver_app/models/get_profile.dart';
import 'package:ambrd_driver_app/models/ongoingridemodels.dart';
import 'package:ambrd_driver_app/models/payout_model_for_driver.dart';
import 'package:ambrd_driver_app/models/state_models.dart';
import 'package:ambrd_driver_app/models/user_list_model_indriverrr.dart';
import 'package:ambrd_driver_app/views/home_view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  //static var baseUrl = 'https://ambrdapi.ndinfotech.com/api/';

  var prefs = GetStorage();
  // NotificationServices notificationServices = NotificationServices();

//  class ApiProvider {
  //static var baseUrl = 'https://ambrdapi.ndinfotech.com/api/';

  static var baseUrl = 'http://admin.ambrd.in/api/';

  final img = 'http://admin.ambrd.in/Images/';

  // static String token = '';
//  static String Id = ''.toString();

  static String userId = ''.toString();
  static String ambulanceId = ''.toString();

  static String AdminLogin_Id = ''.toString();

  //AdminLogin_Id

  static String ServiceId = '';

  static String ambulancetypeid = '';

  static String lat = '';

  static String lng = '';

  static String lat2 = '';

  static String lng2 = '';

  static String vehicletypeid = '';

  static String PatientRegNo = '';

  static String DriverId = '';

  // static String userId = ''.toString();

  ///todo: state api....ambed ...1
  static Future<List<StateModel>> getSatesApi() async {
    var url = '${baseUrl}CommonApi/GetAllStates';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var statesData = statesModelFromJson(r.body);
        return statesData.states;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: apbrb get_cities_api...........2
  static Future<List<City>> getCitiesApi(String stateID) async {
    var url = '${baseUrl}CommonApi/GetCitiesByState?stateId=$stateID';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var citiesData = cityModelFromJson(r.body);
        return citiesData.cities;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: gallary apis.....ambrb................3
  static galarryGetApi() async {
    var url = '${baseUrl}CommonApi/GetGallery';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        GallaryModel gallaryModel = gallaryModelFromJson(r.body);
        return gallaryModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner apis.....ambrb................4
  static getbannerGetApi() async {
    var url = '${baseUrl}CommonApi/GetBanner';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        BannerModel bannerModel = bannerModelFromJson(r.body);
        return bannerModel;
      }
    } catch (error) {
      print('FrenchiesBannerRRRError: ${error}');
      return;
    }
  }

  ///todo: user registration...ambrb....4

  static DriverRegistrationApi(
    var DriverName,
    var MobileNumber,
    var EmailId,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var PinCode,
    var PanNumbar,
    var DlNumber,
    var charge,
    var PanImage,
    var PanImageBase64,
    var DlImage,
    var DlImageBase64,
    var DOB,
    var Gender,
    var DlImage1,
    var DlImage1Base64,
    var DlValidity,
    var AadharImage,
    var AadharImageBase64,
    var AadharImage2,
    var AadharImage2Base64,
    var DriverImage,
    var DriverImageBase64,
    var AadharNumber,
  ) async {
    var url = '${baseUrl}SignupApi/DriverReg';
    var body = {
      "DriverName": "$DriverName",
      "MobileNumber": "$MobileNumber",
      "EmailId": "$EmailId",
      "StateMaster_Id": "$StateMaster_Id",
      "CityMaster_Id": "$CityMaster_Id",
      "Location": "$Location",
      "PinCode": "$PinCode",
      "PanNumbar": "$PanNumbar",
      "DlNumber": "$DlNumber",
      "charge": "$charge",
      "PanImage": "$PanImage",
      "PanImageBase64": "$PanImageBase64",
      "DlImage": "$DlImage",
      "DlImageBase64": "$DlImageBase64",
      "DOB": "$DOB",
      "Gender": "$Gender",
      "DlImage1": "$DlImage1",
      "DlImage1Base64": "$DlImage1Base64",
      "DlValidity": "$DlValidity",
      "AadharImage": "$AadharImage",
      "AadharImageBase64": "$AadharImageBase64",
      "AadharImage2": "$AadharImage2",
      "AadharImage2Base64": "$AadharImage2Base64",
      "DriverImage": "$DriverImage",
      "DriverImageBase64": "$DriverImageBase64",
      "AadharNumber": "$AadharNumber"
    };
    //print("ok1:${body}");
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    //print("dob:${DOB}");

    print("DriverName:${DriverName}");
    print("MobileNumber:${MobileNumber}");
    print("EmailId:${EmailId}");
    print("StateMaster_Id:${StateMaster_Id}");
    print("CityMaster_Id:${CityMaster_Id}");
    print("Location:${Location}");
    print("PinCode:${PinCode}");
    print("PanNumbar:${PanNumbar}");
    print("charge:${charge}");
    print("panimage:${PanImage}");
    print("DlImage:${DlImage}");
    print("DOB:${DOB}");
    print("DlImageBase64:${DlImageBase64}");

    print("Gender:${Gender}");
    print("DlImage1:${DlImage1}");
    print("DlImage1Base64:${DlImage1Base64}");
    print("DlValidity:${DlValidity}");
    print("AadharImage:${AadharImage}");
    print("AadharImageBase64:${AadharImageBase64}");
    print("AadharImage2:${AadharImage2}");
    print("AadharImage2Base64:${AadharImage2Base64}");
    print("DriverImage:${DriverImage}");
    print("DriverImageBase64:${DriverImageBase64}");
    print("AadharNumber:${AadharNumber}");
    //AadharNumber

    print("okup:${r.body}");
    if (r.statusCode == 200) {
      print("DriverNameokoko:${DriverName}");
      print("MobileNumberlplp:${MobileNumber}");
      print("EmailIdpplplp:${EmailId}");
      print("StateMaster_Idknkn:${StateMaster_Id}");
      print("CityMaster_Idkmk:${CityMaster_Id}");
      print("Locationoko:${Location}");
      print("PinCodeknk:${PinCode}");

      print("PanNumbarkkmnk:${PanNumbar}");
      print("chargenjnj:${charge}");
      print("panimageknk:${PanImage}");
      print("DOBkmk:${DOB}");
      print("Genderwdw:${Gender}");
      print("DlImage1sd:${DlImage1}");
      print("DlImage1Base64scs:${DlImage1Base64}");
      print("DlValidityssss:${DlValidity}");
      print("AadharImagesscx:${AadharImage}");
      print("AadharImageBase64sxasx:${AadharImageBase64}");
      print("AadharImage2sxas:${DlImage}");
      print("AadharImage2Base64scxsa:${DOB}");
      print("DriverImagessa:${DlImageBase64}");

      print("DriverImageBase64scasc:${DOB}");
      print("AadharNumbersscsc:${AadharNumber}");

      ///print(r.body);
      print("okupdonebody:${body}");

      print("okupdone:${r.body}");
      Get.snackbar(
        'Success',
        r.body,
        duration: const Duration(seconds: 2),
      );
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      print("okupdonebody401:${body}");
      print("ok401:${r.body}");

      Get.snackbar(
        'Message',
        r.body,
        duration: Duration(seconds: 2),
      );
    } else {
      print("error:${body}");
      print("okerror:${r.body}");
      Get.snackbar('Error', r.body, duration: Duration(seconds: 2));
      return r;
    }
  }

  ///todo: ambrb banner api.........................................5

  // static verifyOTP(var Otp, var MobileNo) async {
  //   var url = "https://jkroshini.com/api/Registration/OtpVerify";
  //   http.Response r = await http.post(
  //     Uri.parse(url),
  //     body: jsonEncode({"Otp": "$Otp", "MobileNo": "$MobileNo"}),
  //     headers: {
  //       "content-type": "application/json",
  //       "accept": "application/json",
  //     },
  //   );
  //   print("OtpVerify${r.body}");
  //   if (r.statusCode == 200) {
  //     return r;
  //   } else if (r.statusCode == 401) {
  //     Get.snackbar('message', r.body);
  //   } else {
  //     Get.snackbar('Error', r.body);
  //     return r;
  //   }
  // }

  ///todo: login with phone api.....6

  static PhoneLoginApi(
    var MobileNumber,
  ) async {
    var url = '${baseUrl}CommonApi/LoginWithMobile';
    var body = {
      "MobileNumber": MobileNumber,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      // var prefs = GetStorage();
      // //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///TODO: otp verify section......................7.....

  static verifyOTP(var MobileNumber, var OTP) async {
    var url = '${baseUrl}CommonApi/MobileOtpVerify';
    var body = {
      'MobileNumber': "$MobileNumber",
      'OTP': "$OTP",
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();

      //saved id..........
      prefs.write("userId".toString(), json.decode(r.body)['data']['UserId']);
      userId = prefs.read("userId").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&user:${userId}');

      ///AdminLogin_Id
      prefs.write("AdminLogin_Id".toString(),
          json.decode(r.body)['data']['AdminLogin_Id']);
      AdminLogin_Id = prefs.read("AdminLogin_Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&admin:${AdminLogin_Id}');
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
    // http.Response r = await http.post(Uri.parse(url), body: body);
    // print(r.body);
    // if (r.statusCode == 200) {
    //   var data = json.decode(r.body)['message'];
    //   var prefs = GetStorage();
    //   prefs.write("token", json.decode(r.body)['token']);
    //   token = prefs.read("token");
    //   return r;
    // } else {
    //   Get.snackbar('Error', 'Wrong Otp');
    //   return null;
    // }
  }

  ///todo: edit profile user...ambrb....8

  static EditDriverApi(
    var DriverName,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var PinCode,
  ) async {
    var url = '${baseUrl}DriverApi/EditDriverProfile';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuser:${userId}');
    var body = {
      "Id": userId,
      "DriverName": "$DriverName",
      "StateMaster_Id": "$StateMaster_Id",
      "CityMaster_Id": "$CityMaster_Id",
      "Location": "$Location",
      "PinCode": "$PinCode",
    };
    print("ok1:${body}");
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print("okup:${r.body}");
    if (r.statusCode == 200) {
      print("okname:${DriverName}");

      print("okup:${r.body}");

      print(r.body);
      Get.snackbar(
        'Success',
        r.body,
        duration: const Duration(seconds: 2),
      );
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar(
        'Message',
        r.body,
        duration: Duration(seconds: 2),
      );
    } else {
      Get.snackbar('Error', r.body, duration: Duration(seconds: 2));
      return r;
    }
  }

  ///todo: banner apis.....ambrb................9
  static geProfileApi() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuserprofile:${userId}');
    //http://admin.ambrd.in/api/DriverApi/GetDriverProfile?Id=1
    var url = '${baseUrl}DriverApi/GetDriverProfile?Id=$userId';
    //'$userId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        GetProfileDetail getprofileModel = getProfileDetailFromJson(r.body);
        return getprofileModel;
      }
    } catch (error) {
      print('Errorprofile: ${error}');
      return;
    }
  }

  ///todo: bank detail...ambrb....10

  static AddBankDetailApi(
    var AccountNumber,
    var IFSCCode,
    var BranchName,
    var BranchAddress,
    var HolderName,
    var MobileNumber,
  ) async {
    var url = '${baseUrl}CommonApi/AddBankDetail';
    var prefs = GetStorage();
    AdminLogin_Id = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&bankadmgcgin:${AdminLogin_Id}');
    userId = prefs.read("userId").toString();
    print('&readuserbank:${userId}');
    var body = {
      "Login_Id": AdminLogin_Id,
      "AccountNumber": "$AccountNumber",
      "IFSCCode": "$IFSCCode",
      "BranchName": "$BranchName",
      "BranchAddress": "$BranchAddress",
      "HolderName": "$HolderName",
      "MobileNumber": "$MobileNumber"
    };
    print("ok1:${body}");
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print("okup:${r.body}");
    if (r.statusCode == 200) {
      print(r.body);
      Get.snackbar(
        'Success',
        r.body,
        duration: const Duration(seconds: 2),
      );
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar(
        'Message',
        r.body,
        duration: Duration(seconds: 2),
      );
    } else {
      Get.snackbar('Error', r.body, duration: Duration(seconds: 2));
      return r;
    }
  }

  ///todo: edit bank detail...ambrb....111

  static EditBankDetailApi(
    var AccountNumber,
    var IFSCCode,
    var BranchName,
    var BranchAddress,
    var HolderName,
    //var MobileNumber,
  ) async {
    var url = '${baseUrl}CommonApi/UpdateBankDetail';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    AdminLogin_Id = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&bankadmgcgin:${AdminLogin_Id}');
    print('&readuserbank:${userId}');
    var body = {
      "Login_Id": AdminLogin_Id,
      "AccountNumber": "$AccountNumber",
      "IFSCCode": "$IFSCCode",
      "BranchName": "$BranchName",
      "BranchAddress": "$BranchAddress",
      "HolderName": "$HolderName",
      // "MobileNumber": "$MobileNumber"
    };
    print("ok1edit:${body}");
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print("okup:${r.body}");
    if (r.statusCode == 200) {
      print(r.body);
      Get.snackbar(
        'Success',
        r.body,
        duration: const Duration(seconds: 2),
      );
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar(
        'Message',
        r.body,
        duration: Duration(seconds: 2),
      );
    } else {
      Get.snackbar('Error', r.body, duration: Duration(seconds: 2));
      return r;
    }
  }

  ///todo: banner apis.....ambrb................11
  static allServicesApi() async {
    var url = '${baseUrl}CommonApi/GetAllService';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        AllServicesUser allservicesModel = allServicesUserFromJson(r.body);
        return allservicesModel;
      }
    } catch (error) {
      print('Errorprofile: ${error}');
      return;
    }
  }

  ///todo: driver payment history...ambrd .....12

  /// todo driverPaymentHistory...................
  static DriverPaymentHistory() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userId}');
    var url = '${baseUrl}DriverApi/DriverPaymentHistory?DriverId=1';
    //176
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        //DriverAppoinmentDetailModel driverAppoinmentDetail =
        //             driverAppoinmentDetailModelFromJson(r.body);
        DriverPaymentHistoryModel driverPaymentHistoryModel =
            driverPaymentHistoryModelFromJson(r.body);
        return driverPaymentHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driverPaymentHistory...............13....
  static DriverBookingHistory() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userId}');
    var url = '${baseUrl}DriverApi/AmbulanceBookingHistory?DriverId=$userId';
    //176
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        //DriverAppoinmentDetailModel driverAppoinmentDetail =
        //             driverAppoinmentDetailModelFromJson(r.body);
        DriverBookingHistoryModel driverBookingHistoryModel =
            driverBookingHistoryModelFromJson(r.body);
        return driverBookingHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  /// todo driverPaymentHistory...............14....
  static DriverRequestBookingApi() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userId}');
    var url = '${baseUrl}DriverApi/AmbulanceBookingRequest?DriverId=1';
    //176
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        //DriverAppoinmentDetailModel driverAppoinmentDetail =
        //             driverAppoinmentDetailModelFromJson(r.body);
        DriverBookingRequestListModel driverbookinglistModel =
            driverBookingRequestListModelFromJson(r.body);
        return driverbookinglistModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: here ongoing ride user and track....29 dec 2023...........
  static OngoingRideApiApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driverlistbookingId = preferences.getString("driverlistbookingId");
    print("driverlistbookingId: ${driverlistbookingId}");
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&userid:${userId}');
    //driverlistbookingId
    //http://admin.ambrd.in/api/PatientApi/GetAcceptedReqDriverDetail?Id=1
    //http://admin.ambrd.in/api/DriverApi/GetOnGoingRide_UserDetail?DriverId=1
    var url = '${baseUrl}DriverApi/GetOnGoingRide_UserDetail?DriverId=$userId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("ambulanceonl:${r.body}");
        print("ambulanceonliner:${url}");

        OngoingRideModel ongoingRideModel = ongoingRideModelFromJson(r.body);
        return ongoingRideModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: google update driver location api on .......20 dec 2023.......,,,,,,.....................

  static GoogleupdatedriverApi(
    var Lat,
    var Lang,
  ) async {
    //http://admin.ambrd.in/api/DriverApi/UpdateDriverLocation

    var url = baseUrl + 'DriverApi/UpdateDriverLocation';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&xzxzuserid:${userId}');

    var body = {
      "DriverId": userId,
      "Lat": Lat.toString(),
      "Long": Lang.toString(),
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(r.statusCode);

      /// Get.snackbar("title", '${r.body}');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: complete ride api on .......20 dec 2023.......,,,,,,.....................

  static CompleteridedriverApi(
    var Id,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var DriverListId = preferences.getString("DriverListId");
    print("DriverListId3434: ${DriverListId}");

    var url = baseUrl + 'DriverApi/CompleteRide';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&xzxzuserid:${DriverListId}');

    var body = {
      "Id":
          //"178",
          "${DriverListId}",
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(r.statusCode);
      print('&&&&&&&&body:${body}');

      /// Get.snackbar("title", '${r.body}');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: google update driver toogle index api on .......20 dec 2023.......,,,,,,.....................

  static TogglestatusdriverApi(
    var IsActiveStatus,
  ) async {
    var url = baseUrl + 'DriverApi/DriverActiveStatus';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&xzxzuserid:${userId}');

    var body = {
      "Id": userId,
      "IsActiveStatus": "${IsActiveStatus}"
      //"Long": Lang.toString(),
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    if (IsActiveStatus == true) {
      print(r.body);
      print(r.statusCode);
      //var SnackDismissDirection;
      Get.snackbar(
        "Status",
        '${r.body}',
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.shade500,
        borderRadius: 10,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 2),
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        //dismissDirection: SnackDismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      // Get.snackbar(
      //   "Status", '${r.body}',
      //   // colorText:
      // );
      return r;
    } else {
      Get.snackbar(
        "Status",
        '${r.body}',
        icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.shade500,
        borderRadius: 10,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
        snackStyle: SnackStyle.FLOATING,
        //dismissDirection: SnackDismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
    //print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(r.statusCode);
      //var SnackDismissDirection;
      ///
      // Get.snackbar(
      //   "Status",
      //   '${r.body}',
      //   icon: Icon(Icons.person, color: Colors.white),
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: Colors.green.shade500,
      //   borderRadius: 10,
      //   margin: EdgeInsets.all(15),
      //   colorText: Colors.white,
      //   duration: Duration(seconds: 5),
      //   isDismissible: true,
      //   snackStyle: SnackStyle.FLOATING,
      //   //dismissDirection: SnackDismissDirection.horizontal,
      //   forwardAnimationCurve: Curves.easeOutBack,
      // );
      ///
      // Get.snackbar(
      //   "Status", '${r.body}',
      //   // colorText:
      // );
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: from here driver...accept reject list...15 url will change
  ///todo:driver list of accept reject list 2.............22
  static UserListUserrApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nurseLocationId = preferences.getString("nurseLocationId");
    print("nurseLocationId: ${nurseLocationId}");
    var url =
        "http://test.pswellness.in/api/DriverApi/UserListForBookingAmbulance";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("userlistIdUrl77: ${url}");
        print("userlistIdUrl774343: ${r.body}");
        UserListModeldriver? userListModeldriver =
            userListModeldriverFromJson(r.body);
        return userListModeldriver;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: accept ambulance api on of driver ambrd....21 dec 2023.......25,,,,,,.....................
  static AcceptrequestdriverApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driacceptrejectlistid = preferences.getString("driacceptrejectlistid");
    print("driacceptrejectlistid: ${driacceptrejectlistid}");
    // driacceptrejectlistid
    var url = '${baseUrl}DriverApi/BookingAmbulanceAccept';
    // http://test.pswellness.in/api/DriverApi/BookingAmbulanceAcceptReject
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');

    var body = {
      "Id": "${driacceptrejectlistid}",
      "DriverId": userId,
      "StatusId": "${1}",

      ///for testing perpose i am....up...0
      ///

      ///this is the main actual down..1
      //"StatusId": "${1}",
    };
    //
    print("acceptttt:${body}");
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      //saved id..........
      // var prefs = GetStorage();
      // prefs.write("ambulancetypeid".toString(),
      //     json.decode(r.body)['AmbulanceType_id']);
      // ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      // print('&userdriambulance:${AmbulanceType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Accept Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: accepted driver list  ...user api...21
  static AcceptDriverDetailUserApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driverlistbookingId = preferences.getString("driverlistbookingId");
    print("driverlistbookingId: ${driverlistbookingId}");

    var driacceptrejectlistid = preferences.getString("driacceptrejectlistid");
    print("driacceptrejectlistid: ${driacceptrejectlistid}");
    //driverlistbookingId
    var url =
        '${baseUrl}api/DriverApi/GetAcceptedReqDriverDetail?Id=$driverlistbookingId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("ambulanceonlinerrreeeww:${r.body}");
        print("ambulanceonlinerrreeeww:${url}");

        DriveracceptModeluser driveracceptuserDetail =
            driveracceptModeluserFromJson(r.body);
        return driveracceptuserDetail;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: reject driver list 21  dec 2023....driver api.ambrd.....24

  static RejectrequestdriverApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driacceptrejectlistid = preferences.getString("driacceptrejectlistid");
    print("driacceptrejectlistid: ${driacceptrejectlistid}");
    //http://test.pswellness.in/api/DriverApi/AmbulanceReject
    var url = '${baseUrl}DriverApi/BookingAmbulanceAccept';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');

    var body = {
      "Id": "${driacceptrejectlistid}",
      "DriverId": userId,
      //"StatusId": "${0}",
    };
    //
    print("rejectt:${body}");
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      print("rejecttdfdfd:${body}");
      print("rejecttdfdfccsad:${r.body}");

      //r.body

      ///ambulance..
      //saved id..........
      // var prefs = GetStorage();
      // prefs.write("ambulancetypeid".toString(),
      //     json.decode(r.body)['AmbulanceType_id']);
      // ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      // print('&userdriambulance:${AmbulanceType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", ' Reject Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  /// todo driverPayoutHistory.............8...jan 2024......
  static UserPayoutHistory() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');
    //http://admin.ambrd.in/api/DriverApi/DriverPayoutHistory?DriverId=1
    var url = '${baseUrl}DriverApi/DriverPayoutHistory?DriverId=$userId';
    //176
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        //DriverAppoinmentDetailModel driverAppoinmentDetail =
        //             driverAppoinmentDetailModelFromJson(r.body);
        DriverPayoutHistoryModel driverPayoutHistoryModel =
            driverPayoutHistoryModelFromJson(r.body);
        return driverPayoutHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: get bank apis.....ambrb................29
  static geBankkApi() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    AdminLogin_Id = prefs.read("AdminLogin_Id").toString();
    print('&&&&&okadmin:${AdminLogin_Id}');
    userId = prefs.read("userId").toString();
    print('&readuserprofile:${userId}');
    //admin.ambrd.in/api/CommonApi/GetBankDetail?AdminLoginId=15
    var url = '${baseUrl}CommonApi/GetBankDetail?AdminLoginId=$AdminLogin_Id';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        BankGetModel getbankprofileModel = bankGetModelFromJson(r.body);
        return getbankprofileModel;
      }
    } catch (error) {
      print('Errorprofile: ${error}');
      return;
    }
  }

  ///todo:end.... ambrd driver app.............

  ///todo:old apis.....

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
  static verifyOTP233(var MobileNo, var Otp) async {
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
