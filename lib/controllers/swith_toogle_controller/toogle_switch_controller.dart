import 'package:get/get.dart';

/// GetX Controller for holding Switch's current value
class SwitchX extends GetxController {
  RxBool on = false.obs; // our observable

  // swap true/false & save it to observable
  void toggle() => on.value = on.value ? false : true;
}

//void toggleSwitch(bool value) {
//     if (isSwitched == false) {
//       setState(() {
//         isSwitched = true;
//         textValue = 'ONLINE';
//       });
//       print('Switch Button is ON');
//     } else {
//       setState(() {
//         isSwitched = false;
//         textValue = 'OFFLINE';
//       });
//       print('Switch Button is OFF');
//     }
//   }
