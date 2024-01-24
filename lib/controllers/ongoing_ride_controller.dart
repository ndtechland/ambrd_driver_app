import 'dart:async';

import 'package:ambrd_driver_app/models/ongoingridemodels.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:get/get.dart';

class OngoingRideController extends GetxController {
  RxBool isLoading = true.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  OngoingRideModel? ongoingRide;

  Future<void> ongoingRideApi() async {
    isLoading(true);

    ongoingRide = await ApiProvider.OngoingRideApiApi();
    if (ongoingRide?.patientName == null) {
      Timer(
        const Duration(seconds: 1),
        () {
          //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(false);
      ongoingRide = await ApiProvider.OngoingRideApiApi();
    }
    if (ongoingRide?.patientName != null) {
      //Get.to(() => TotalPrice());
      isLoading(false);
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

  @override
  void onInit() {
    ongoingRideApi();

    ///OngoingRideController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
