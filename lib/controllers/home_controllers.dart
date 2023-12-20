import 'package:ambrd_driver_app/models/all_services_model.dart';
import 'package:ambrd_driver_app/models/banner_model.dart';
import 'package:ambrd_driver_app/services/api_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  var name = '';
  RxBool isLoading = true.obs;
  BannerModel? getsliderbaner;
  AllServicesUser? allServicesUser;
//  ServiceDetailModel? serviceDetailModel;

  ///crusial slider banner api..............................................

  Future<void> sliderBannerApi() async {
    isLoading(true);
    getsliderbaner = await ApiProvider.getbannerGetApi();
    if (getsliderbaner?.banner != null
        //getsliderbaner!.bannerImageList!.isNotEmpty
        ) {
      isLoading(false);
    } else {}
  }

  ///todo: all services.....................
  Future<void> AllServicesApi() async {
    isLoading(true);
    allServicesUser = await ApiProvider.allServicesApi();
    if (allServicesUser != null) {
      isLoading(false);
    } else {}
  }
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

    sliderBannerApi();
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
