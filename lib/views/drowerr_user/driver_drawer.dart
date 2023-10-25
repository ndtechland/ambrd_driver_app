import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_nav_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class MainAmbrbdriverDrawer extends StatelessWidget {
  const MainAmbrbdriverDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ///NavController _navController = Get.put(NavController(), permanent: true);
    //GetProfileController _getProfileController = Get.put(GetProfileController());
    //WalletController _walletController = Get.put(WalletController());
    //GetProfileController _getProfileController = Get.put(GetProfileController());

    // WalletPostController _walletPostController = Get.put(WalletPostController());
    //_walletController.walletListssApi();

    NavController _navcontroller = Get.put(NavController());

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
                          child: Image.asset('assets/logo222.png'),
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
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // _navController.tabindex(3);
                /// Get.to(() => NavBar());
                //Get.to(() => BestDeal());
                Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.card_giftcard_outlined,
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
                'Update Profile',
                //'Gift Boxes',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/GiftBox' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => GiftBox());
                Get.offNamed('/GiftBox');
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
              tileColor:
                  Get.currentRoute == '/OurStory' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                //Get.to(() => OurStory());
                Get.offNamed('/OurStory');
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
              tileColor:
                  Get.currentRoute == '/Blogss' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                //Get.back();
                // Get.to(() => Blogss());
                Get.offNamed('/Blogss');
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
                Get.back();
                // Get.to(() => WhatsAppTrackOrder());
                Get.offNamed('/WhatsAppTrackOrder');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.track_changes_sharp,
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
                'Contact Us',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/WebViewTracking'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => WebViewTracking());
                //WaveViewHomePage(title: appName));
                //Tracking());
                Get.offNamed('/WebViewTracking');
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

                //Get.to(() => PersonalProfile());
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
              onTap: () {
                print(Get.currentRoute);

                GetStorage prefs = GetStorage();
                prefs.erase();
                //prefs.remove('email');

                //Get.to(() => LoginPage());
                Get.offNamed('/LoginPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
