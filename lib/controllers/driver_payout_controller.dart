import 'package:ambrd_driver_app/models/payout_model_for_driver.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:get/get.dart';

class DriverPayouttHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  DriverPayoutHistoryModel? getDriverPayoutHistory;
  //DriverPaymentHistoryModel

  Future<void> userBookingHistoryApi() async {
    isLoading(true);
    getDriverPayoutHistory = await ApiProvider.UserPayoutHistory();
    if (getDriverPayoutHistory != null) {
      isLoading(false);
      foundpayouthistorydriver.value = getDriverPayoutHistory!.payoutHistory!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    userBookingHistoryApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxList<PayoutHistory> foundpayouthistorydriver = RxList<PayoutHistory>([]);
  void filterdriverpayouthistory(String searchpaymenthistorydriverName) {
    List<PayoutHistory>? finalResult = [];
    if (searchpaymenthistorydriverName.isEmpty) {
      finalResult = getDriverPayoutHistory!.payoutHistory;
    } else {
      finalResult = getDriverPayoutHistory!.payoutHistory!
          .where((element) => element.payoutDate
              .toString()
              .toLowerCase()
              .contains(searchpaymenthistorydriverName
                  .toString()
                  .toLowerCase()
                  .trim()))
          .toList();
    }
    print(finalResult!.length);
    foundpayouthistorydriver.value = finalResult!;
  }
}
