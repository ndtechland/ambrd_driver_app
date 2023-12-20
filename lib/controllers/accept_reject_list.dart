import 'dart:async';

import 'package:ambrd_driver_app/models/user_list_model_indriverrr.dart';
import 'package:ambrd_driver_app/services/account_service_forautologin.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:ambrd_driver_app/widget/circular_loader.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//import 'package:intl/intl.dart';

class UseracptrejectController extends GetxController {
  RxBool isLoading = true.obs;
  UserListModeldriver? userListModeldriver;

  void driveracceptrejctlistApi() async {
    isLoading(true);
    userListModeldriver = await ApiProvider.UserListUserrApi();
    if (userListModeldriver?.userListForBookingAmbulance != null) {
      print(
          "okokhvghjbnklmdc${userListModeldriver?.userListForBookingAmbulance?.length}");
      isLoading(false);
    }
  }

  ///todo: accept driver booking................
  void acceptbookingdriverApi() async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.AcceptrequestdriverApi();

    if (r.statusCode == 200) {
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      CallLoader.hideLoader();
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 300),
          () {
            /// Get.to(DriverHomePage());
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
  void rejectbookingdriverApi() async {
    ///CallLoader.loader();
    http.Response r = await ApiProvider.RejectrequestdriverApi();

    if (r.statusCode == 200) {
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      CallLoader.hideLoader();
      accountService.getAccountData.then((accountData) {
        Timer(
          const Duration(milliseconds: 300),
          () {
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

  @override
  void onInit() {
    super.onInit();
    driveracceptrejctlistApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //TextEditingController.dispose();
  }

//bool disableDate(DateTime day) {
//   if ((day.isAfter(DateTime.now().subtract(Duration(days: 4))) &&
//       day.isBefore(DateTime.now().add(Duration(days: 30))))) {
//     return true;
//   }
//   return false;
// }
}
