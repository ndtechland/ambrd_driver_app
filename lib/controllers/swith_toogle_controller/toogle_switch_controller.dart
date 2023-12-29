import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/// GetX Controller for holding Switch's current value
class SwitchX extends GetxController {
  RxBool on = true.obs; // our observable

  // swap true/false & save it to observable
  void toggle() => on.value = on.value ? false : true;

  var selectedstatus = "".obs;

  onChangeStatus(String servicee) {
    selectedstatus.value = servicee;
  }

  ///todo:date of birth..................
  var selectedDate = DateTime.now().obs;
  var selectedDate2 = DateTime.now().obs;

  final selectedgender = "".obs;

  onChangeGender(String servicee) {
    selectedgender.value = servicee;
  }

  ///this is radio button function......
  var selectedService = ''.obs;

  onChangeService(String service) {
    selectedService.value = service;
  }

  Future<void> ToogleStatusApi() async {
    http.Response r = await ApiProvider.TogglestatusdriverApi(
      on.value,
    );
    if (r.statusCode == 200) {
      //CallLoader.hideLoader();
      // Get.snackbar('Success', 'Registration SuccessFully');
      //  _loginMobileController.login();

      //Get.offAll(() => LoginScreen());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
