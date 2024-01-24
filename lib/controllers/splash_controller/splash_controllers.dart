import 'dart:async';

import 'package:ambrd_driver_app/controllers/booking_request_list_controller.dart';
import 'package:ambrd_driver_app/controllers/edit_bank_controller/edit_bank_detail_controller.dart';
import 'package:ambrd_driver_app/controllers/get_profile_controller.dart';
import 'package:ambrd_driver_app/controllers/home_controllers.dart';
import 'package:ambrd_driver_app/controllers/swith_toogle_controller/toogle_switch_controller.dart';
import 'package:ambrd_driver_app/services/account_service_forautologin.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_navbar.dart';
import 'package:ambrd_driver_app/views/login_view_driver/login_page.dart';
import 'package:ambrd_driver_app/widget/circular_loader.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // late AnimationController animationController;
  // Animation<double>? animation;
  //VehicleServicecatController _vehicleservicecatController =
  // Get.put(VehicleServicecatController());
  NavController _navController = Get.put(NavController());
  HomeController _homePageController = Get.put(HomeController());
  DriverRequestListController _driverRequestListController =
      Get.put(DriverRequestListController());
  GetProfileController _getProfileController = Get.put(GetProfileController());
  EditbankdetailController _editbankdetailController =
      Get.put(EditbankdetailController());

  SwitchX tooglecontroller = Get.put(SwitchX());

//my
  final getStorage = GetStorage();

  ///todo:apiiii....driver update location...
  // Future<void> postssDriverUpdateApi() async {
  //   http.Response r = await ApiProvider.GoogleupdatedriverApi(
  //     lat,
  //     lang,
  //   );
  //   if (r.statusCode == 200) {
  //     //Get.snackbar('message', r.body);
  //     var data = jsonDecode(r.body);
  //   }
  // }

  @override
  void onInit() {
    // animationInitilization();
    super.onInit();

    accountService.getAccountData.then((accountData) {
      Timer(
        const Duration(seconds: 3),
        () async {
          if (accountData == null) {
            await _homePageController.AllServicesApi();
            await _homePageController.sliderBannerApi();
            await _driverRequestListController.driverRequestListApi();
            _driverRequestListController.onInit();
            _getProfileController.getProfileApi();
            _editbankdetailController.getBankProfileApi();
            //tooglecontroller.ToogleStatusApi();
            _homePageController.onInit();

            //await _vehicleservicecatController.servicecatvehicleApi();
            // _vehicleservicecatController.onInit();
            // _vehicleservicecatController.update();

            await Get.to(LoginScreen());

            ///todo: 2 sep....2023..
            throw Exception();
          } else {
            // SharedPreferences
            // prefs =
            // await SharedPreferences
            //     .getInstance();
            // prefs.setString(
            //     "AmbulancelistssId",
            //     "${_userHomepagContreoller.ambulancetype!.ambulanceT![index].id.toString()}");
            // _ambulancegetController
            //     .update();

            accountService.getAccountData.then((accountData) {
              CallLoader.loader();
              Timer(
                const Duration(seconds: 0),
                () {
                  // Get.to(
                  //  MapView());
                  // CallLoader
                  //     .hideLoader();
                  //_ambulancegetController.selectedvhicleCatagary();
                  //_ambulancegetController.ambulancecatagaryyApi();
                  //Get.to((MapView));

                  ///
                },
              );
              //CallLoader.hideLoader();
            });
            _getProfileController.getProfileApi();
            _editbankdetailController.getBankProfileApi();
            await _homePageController.AllServicesApi();
            await _homePageController.sliderBannerApi();

            ///_homePageController.onInit();
            await _driverRequestListController.driverRequestListApi();
            _driverRequestListController.onInit();
            await tooglecontroller.ToogleStatusApi();
            await Future.delayed(Duration(milliseconds: 300));
            CallLoader.hideLoader();
            await _navController.tabindex(0);
            await Get.to(BottomNavBar());

            //await CallLoader.hideLoader();

            // await _homePageController.AllServicesApi();
            //await _homePageController.sliderBannerApi();
            // _homePageController.onInit();

            // await _vehicleservicecatController.servicecatvehicleApi();
            //_vehicleservicecatController.onInit();
            //  _vehicleservicecatController.update();
            ///
            // switch (accountData.role) {
            //   case 'patient':
            //     _userprofile.userprofileApi();
            //     _userprofile.update();
            //     _devicetokenController.UsertokenApi();
            //
            //     /// we can navigate to user page.....................................
            //     Get.to(UserHomePage());
            //
            // }
          }
        },
      );
    });

    ///todo: from here we have auto login function...code..
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Get.to(
    //     LoginScreen(),
    //     // WelcomeScreen(),
    //   ),
    // );
    //Get.to(() => WelcomeScreen());
  }

  @override
  void onReady() {
    super.onReady();
    // if (getStorage.read("id") != null) {
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.LOGIN);
    //   });
    // }

    ///
    // if (getStorage.read("id") != null) {
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.HOME);
    //   });
    // }
    ///
    // else {
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.LOGIN);
    //   });
    // }
  }

// animationInitilization() {
//   animationController =
//       AnimationController(vsync: this, duration: const Duration(seconds: 3));
//   animation =
//       CurvedAnimation(parent: animationController, curve: Curves.easeOut)
//           .obs
//           .value;
//   animation.addListener(() => update());
//   animationController.forward();
//   //Get.to(() => WelcomeScreen());
// }

//Get.to(() => WelcomeScreen());

}

// abstract class Routes {
//   Routes._();
//   static const SPLASH = _Paths.SPLASH;
//   static const HOME = _Paths.HOME;
//
//   static const LOGIN = _Paths.LOGIN;
// }
///
// abstract class _Paths {
//   _Paths._();
//   static const SPLASH = '/splash';
//   static const HOME = '/home';
//
//   static const LOGIN = '/login';
// }
