import 'package:ambrd_driver_app/models/get_profile.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/api_provider.dart';

class GetProfileController extends GetxController {
  final getStorage = GetStorage();
  var name = '';
  RxBool isLoading = true.obs;
  GetProfileDetail? getProfileDetail;
  //crusial slider banner api............

  Future<void> getProfileApi() async {
    isLoading(true);
    getProfileDetail = await ApiProvider.geProfileApi();
    if (getProfileDetail?.driverName != null
        //getsliderbaner!.bannerImageList!.isNotEmpty
        ) {
      isLoading(false);
    } else {}
  }

  @override
  void onInit() {
    super.onInit();
    getProfileApi();
    // auto login
    //name = getStorage.read("name");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    Get.delete<GetProfileController>();
    super.dispose();
  }

  // @override
  // void onClose() {
  //   //TODO: implement oninit
  //   super.onClose();
  // }
  logout() {
    getStorage.erase();
    // Get.offAllNamed(Routes.LOGIN);
  }
}
