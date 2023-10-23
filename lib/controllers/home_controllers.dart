import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  var name = '';
  RxBool isLoading = true.obs;
  // SliderListModel? getsliderbaner;
  //crusial slider banner api..........

  // void sliderBannerApi() async {
  //   isLoading(true);
  //   getsliderbaner = await ApiProvider.SliderBannerApi();
  //   if (getsliderbaner != null
  //       //getsliderbaner!.bannerImageList!.isNotEmpty
  //       ) {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    super.onInit();

    /// sliderBannerApi();
    // auto login
    //name = getStorage.read("name");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  // @override
  // void onClose() {
  //   //TODO: implement oninit
  //   super.onClose();
  // }
  logout() {
    getStorage.erase();
    //Get.offAllNamed(Routes.LOGIN);
  }
}
