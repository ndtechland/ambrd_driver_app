import 'dart:async';

import 'package:ambrd_driver_app/models/booking_request_model.dart';
import 'package:ambrd_driver_app/services/account_service_forautologin.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:ambrd_driver_app/widget/circular_loader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';
class DriverRequestListController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  DriverBookingRequestListModel? getDriverRequestList;

  ///try...21 dec 2023..
  // void driverRequestListApi() async {
  //   isLoading(true);
  //   getDriverRequestList = await ApiProvider.DriverRequestBookingApi();
  //   if (getDriverRequestList?.userListForBookingAmbulance != null) {
  //     isLoading(false);
  //     founddriverrequestlistdriver.value =
  //         getDriverRequestList!.userListForBookingAmbulance!;
  //   }
  // }

  ///todo from here driver list model api value..............

  Future<void> driverRequestListApi() async {
    isLoading(true);

    getDriverRequestList = await ApiProvider.DriverRequestBookingApi();

    // if (getDriverRequestList?.userListForBookingAmbulance == null) {
    //   Timer(
    //     const Duration(seconds: 1),
    //     () {
    //       //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
    //       //Get.to(() => MedicineCart());
    //       //Get.to((page))
    //       ///
    //     },
    //   );
    //   isLoading(true);
    //   getDriverRequestList = await ApiProvider.DriverRequestBookingApi();
    //   //Get.to(() => TotalPrice());
    //
    //   //foundProducts.value = medicinelistmodel!.data;
    //   //Get.to(()=>Container());
    // }
    if (getDriverRequestList?.userListForBookingAmbulance != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
      founddriverrequestlistdriver.value =
          getDriverRequestList!.userListForBookingAmbulance!;
      // accountService.getAccountData.then((accountData) {
      //   Timer(
      //     const Duration(seconds: 1),
      //     () {
      //       Get.to(CheckOutMedicine());
      //       //Get.to((page))
      //       ///
      //     },
      //   );
      // });
    }
  }

  ///todo: accept driver booking................
  Future<void> acceptbookingdriverApi() async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AcceptrequestdriverApi();

    if (r.statusCode == 200) {
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      CallLoader.hideLoader();
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 500),
          () {
            onInit();
            //rejectbookingdriverApi();
            ///  Get.to(DriverHomePage());
            ///  8 dec 2023
            // _viewhealthchkpreviewController.healthreviewratingApi();
            //_viewhealthchkpreviewController.update();
            // Get.snackbar(
            //     'Add review Successfully', "Review Submitted. Thank-you."
            //   // "${r.body}"
            // );
            //Get.to(() => CheckupSchedulePage());
            //Get.to((page))
            ///
          },
        );
      });
      CallLoader.hideLoader();
    } else {
      //CallLoader.hideLoader();
    }
  }

  ///todo: Reject driver booking................
  Future<void> rejectbookingdriverApi() async {
    ///CallLoader.loader();
    http.Response r = await ApiProvider.RejectrequestdriverApi();

    if (r.statusCode == 200) {
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      CallLoader.hideLoader();
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 500),
          () {
            onInit();
            //rejectbookingdriverApi();
            ///  Get.to(DriverHomePage());
            ///  8 dec 2023
            // _viewhealthchkpreviewController.healthreviewratingApi();
            //_viewhealthchkpreviewController.update();
            // Get.snackbar(
            //     'Add review Successfully', "Review Submitted. Thank-you."
            //   // "${r.body}"
            // );
            //Get.to(() => CheckupSchedulePage());
            //Get.to((page))
            ///
          },
        );
      });
      // CallLoader.hideLoader();
    } else {
      //CallLoader.hideLoader();
    }
  }

  // timer? timer;

  @override
  void onInit() {
    super.onInit();
    //timer = timer.periodic(
    //duration(seconds: 15), (timer t) => checkfornewsharedlists());
    driverRequestListApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    //timer?.cancel();
    super.dispose();
  }

  RxList<UserListForBookingAmbulance> founddriverrequestlistdriver =
      RxList<UserListForBookingAmbulance>([]);
  void filterdriverbookinglist(String searcBookingrequestdriverName) {
    List<UserListForBookingAmbulance>? finalResult = [];
    if (searcBookingrequestdriverName.isEmpty) {
      finalResult = getDriverRequestList!.userListForBookingAmbulance!;
    } else {
      finalResult = getDriverRequestList!.userListForBookingAmbulance!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searcBookingrequestdriverName
                  .toString()
                  .toLowerCase()
                  .trim()))
          .toList();
    }
    print(finalResult!.length);
    founddriverrequestlistdriver.value = finalResult!;
  }
}
