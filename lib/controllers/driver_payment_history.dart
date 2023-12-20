import 'package:ambrd_driver_app/models/driver_payment_history_model.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:get/get.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverPaymentHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  DriverPaymentHistoryModel? getDriverPaymentHistory;

  void driverPaymentHistoryApi() async {
    isLoading(true);
    getDriverPaymentHistory = await ApiProvider.DriverPaymentHistory();
    if (getDriverPaymentHistory?.paymentHistory != null) {
      isLoading(false);
      foundpaymenthistorydriver.value =
          getDriverPaymentHistory!.paymentHistory!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    driverPaymentHistoryApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxList<BookingHistory> foundpaymenthistorydriver = RxList<BookingHistory>([]);
  void filterdriverpaymenthistory(String searchpaymenthistorydriverName) {
    List<BookingHistory>? finalResult = [];
    if (searchpaymenthistorydriverName.isEmpty) {
      finalResult = getDriverPaymentHistory!.paymentHistory!;
    } else {
      finalResult = getDriverPaymentHistory!.paymentHistory!
          .where((element) => element.patientName
              .toString()
              .toLowerCase()
              .contains(searchpaymenthistorydriverName
                  .toString()
                  .toLowerCase()
                  .trim()))
          .toList();
    }
    print(finalResult!.length);
    foundpaymenthistorydriver.value = finalResult!;
  }
}
