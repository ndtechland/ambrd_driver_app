import 'package:ambrd_driver_app/models/booking_request_model.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:get/get.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverRequestListController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  DriverBookingRequestListModel? getDriverRequestList;

  void driverRequestListApi() async {
    isLoading(true);
    getDriverRequestList = await ApiProvider.DriverRequestBookingApi();
    if (getDriverRequestList?.userListForBookingAmbulance != null) {
      isLoading(false);
      founddriverrequestlistdriver.value =
          getDriverRequestList!.userListForBookingAmbulance!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    driverRequestListApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
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
