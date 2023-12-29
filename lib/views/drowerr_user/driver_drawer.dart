import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_driver_app/controllers/get_profile_controller.dart';
import 'package:ambrd_driver_app/controllers/otp_controller_new_correct/otp_new_controller.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/about_us.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/edit_bank.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/edit_profile.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/payment_history.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/payout_history.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/privecy_policy.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/profile_page.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/support_page.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/update_bank.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/website_view.dart';
import 'package:ambrd_driver_app/views/login_view_driver/login_page.dart';
import 'package:ambrd_driver_app/widget/circular_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAmbrbdriverDrawer extends StatelessWidget {
  const MainAmbrbdriverDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    NavController _navcontroller = Get.put(NavController(), permanent: true);

    OtpVerifyController _otpVerifyController = Get.put(OtpVerifyController());

    GetProfileController _getProfileController =
        Get.put(GetProfileController());

    //GetProfileController _getProfileController =
    //Get.put(GetProfileController());

    ///EditprofileController _editprofile = Get.put(EditprofileController());
    ///NavController _navController = Get.put(NavController(), permanent: true);
    //GetProfileController _getProfileController = Get.put(GetProfileController());
    //WalletController _walletController = Get.put(WalletController());
    //GetProfileController _getProfileController = Get.put(GetProfileController());

    // WalletPostController _walletPostController = Get.put(WalletPostController());
    //_walletController.walletListssApi();

    //NavController _navcontroller = Get.put(NavController());

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: MyTheme.ambapp,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset('lib/assets/ambrdcommanlogo.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.home,
                color: Colors.black,
                size: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              // tileColor: Get.currentRoute == '/AllProducts'
              //     ? Colors.grey[300]
              //     : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                _navcontroller.tabindex(0);

                ///Get.to(() => NavBar());
                //Get.to(() => AllProducts());
                Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.person,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  // Get.currentRoute == '/NavBar'
                  //     ? Colors.grey[300]
                  //     :
                  Colors.transparent,
              onTap: () async {
                Get.back();
                // print(Get.currentRoute);

                await Get.to(ProfilePagess());
                await _getProfileController.editProfileApi();
                _getProfileController.onInit();

                ///......
                // _navController.tabindex(3);
                /// Get.to(() => NavBar());
                //Get.to(() => BestDeal());
                // Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.edit,
                color: Colors.black,
                size: 16,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Update Profile',
                //'Gift Boxes',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/EditrProfilePage'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => EditProfilePage());
                //Get.offNamed('/GiftBox');
              },
            ),

            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.food_bank,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Add your bank',
                //'Gift Boxes',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/AddbankPage' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => AddbankPage());
                //Get.offNamed('/GiftBox');
              },
            ),

            ///EditbankPage
            ///
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.edit_note,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Edit your bank',
                //'Gift Boxes',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/AddbankPage' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => EditbankPage());
                //Get.offNamed('/GiftBox');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.history_edu_outlined,
                color: Colors.black,
                size: 11,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Payment History',
                //'Our Story',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/DriverPaymentHistory'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => DriverPaymentHistory());
                //Get.offNamed('/OurStory');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.account_box_outlined,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Payout History',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/DriverPayoutHistory'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                //Get.back();
                Get.to(() => DriverPayoutHistory());
                Get.offNamed('/DriverPayoutHistory');
              },
              //
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.web,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Website',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/WhatsAppTrackOrder'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                // Get.back();
                Get.to(() => WebViewPswebsite());
                // Get.offNamed('/WhatsAppTrackOrder');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Support',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/PersonalProfile'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.................................................28feb....................new
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///........................................................................................

                Get.to(() => SupportViewAmbrdComman());
                Get.offNamed('/PersonalProfile');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.business,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'About Us',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/UserAboutUsView'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.................................................28feb....................new
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///........................................................................................

                Get.to(() => UserAboutUsView());
                Get.offNamed('/UserAboutUsView');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.policy,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Privecy Policy',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/PersonalProfile'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.......................................
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///...........................................................
                Get.to(() => privecy_policy());
                Get.offNamed('/PersonalProfile');
              },
            ),

            /// wallet
            // ListTile(
            //   //horizontalTitleGap: 2.h,
            //   leading: Icon(
            //     Icons.money,
            //     color: Colors.black,
            //     size: 14,
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios_sharp,
            //     size: 11,
            //     color: Colors.black,
            //   ),
            //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -1),
            //   title: Text(
            //     'Change Password',
            //     style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            //   ),
            //   tileColor:
            //       Get.currentRoute == '/Wallet' ? Colors.grey[300] : null,
            //   onTap: () {
            //     print(Get.currentRoute);
            //
            //     //  Get.to(() => Wallet());
            //     Get.offNamed('/Wallet');
            //
            //     ///.................................................28feb....................new
            //     //_walletController.walletListssApi();
            //     //  _walletController.update();
            //     ///......................................................................................................
            //     // tileColor: Get.currentRoute == '/OrderConfirmationPage'
            //     //     ? Colors.grey[300]
            //     //     : null,
            //     // onTap: () {
            //     //   print(Get.currentRoute);
            //     //   Get.to(() => OrderConfirmationPage());
            //     //   Get.offNamed('/OrderConfirmationPage');
            //   },
            // ),
            ///
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.login,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/LoginPage' ? Colors.grey[300] : null,
              onTap: () async {
                print(Get.currentRoute);
                //GetStorage prefs = GetStorage();
                //prefs.erase();
                //prefs.remove('email');

                //Get.to(() => LoginPage());
                //Get.offNamed('/LoginPage');

                ///erase all data...

                _otpVerifyController.onInit();
                CallLoader.loader();
                await Future.delayed(Duration(seconds: 2));
                CallLoader.hideLoader();
                await SharedPreferences.getInstance()
                    .then((value) => value.clear());
                //Get.back();
                await Get.offAll(() => LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
