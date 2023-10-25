import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NavController extends GetxController {
  RxInt tabindex = 0.obs;
  changeTabIndex(int index) {
    tabindex(index);
  }
}
