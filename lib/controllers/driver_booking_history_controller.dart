import 'package:ambrd_driver_app/models/driver_booking_history_model.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:get/get.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverBookingHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  DriverBookingHistoryModel? getDriverBookingHistory;

  void driverBookingHistoryApi() async {
    isLoading(true);
    getDriverBookingHistory = await ApiProvider.DriverBookingHistory();
    if (getDriverBookingHistory?.bookingHistory != null) {
      isLoading(false);
      foundbookinghistorydriver.value =
          getDriverBookingHistory!.bookingHistory!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    driverBookingHistoryApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxList<BookingHistory2> foundbookinghistorydriver =
      RxList<BookingHistory2>([]);
  void filterdriverbookinghistory(String searchbookinghistorydriverName) {
    List<BookingHistory2>? finalResult = [];
    if (searchbookinghistorydriverName.isEmpty) {
      finalResult = getDriverBookingHistory!.bookingHistory!;
    } else {
      finalResult = getDriverBookingHistory!.bookingHistory!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchbookinghistorydriverName
                  .toString()
                  .toLowerCase()
                  .trim()))
          .toList();
    }
    print(finalResult!.length);
    foundbookinghistorydriver.value = finalResult!;
  }
}
