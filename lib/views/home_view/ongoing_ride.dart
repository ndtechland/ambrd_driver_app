import 'dart:async';
import 'dart:convert';

import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_driver_app/controllers/ongoing_ride_controller.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_driver_app/views/firebase_notificationss/firebase_notification_servc.dart';
import 'package:ambrd_driver_app/views/firebase_notificationss/local_notifications.dart';
import 'package:ambrd_driver_app/widget/circular_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class OngoingRideTracking extends StatefulWidget {
  final String id;

  const OngoingRideTracking({Key? key, required this.id}) : super(key: key);

  @override
  State<OngoingRideTracking> createState() => _OngoingRideTrackingState();
}

class _OngoingRideTrackingState extends State<OngoingRideTracking> {
  //DriverPayoutController _driverPayoutController =
  // AmbulancegetController _ambulancegetController =
  //     Get.put(AmbulancegetController());
  NotificationServices notificationServices = NotificationServices();

  OngoingRideController _ongoingRideController =
      Get.put(OngoingRideController());

  NavController _navcontroller = Get.put(NavController(), permanent: true);

  /// AmbulanceOrderpaymentController _ambulanceOrderpaymentController =
  ///Get.put(AmbulanceOrderpaymentController());

  //Wallet_2_Controller _walletPostController = Get.put(Wallet_2_Controller());

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();

    ///
    //  _driverAcceptlistController.driveracceptuserDetailApi();
    // _driverAcceptlistController.update();

    ///
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    // notificationServices.requestNotificationPermission();
    // notificationServices.isTokenRefresh();
    // notificationServices.firebaseInit();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
      // print('device token');
      // print(value);
    });

    /// 1. This method call when app in terminated state and you get a notification
    /// when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );
    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");

          ///you can call local notification........
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  // get kButtonAnimationDuration => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var base = 'http://test.pswellness.in/Images/';

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    Widget titleBox(String title) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(title,
              style: TextStyle(color: colorScheme.onInverseSurface)),
        ),
      );
    }

    ///todo:user start lat
    final usersatartlat =
        (_ongoingRideController.ongoingRide?.startLat?.toDouble() ?? 00.00);

    ///todo:user start lang
    final usersatartlang =
        (_ongoingRideController.ongoingRide?.startLong?.toDouble() ?? 00.00);

    ///todo:user end lat...
    final userendlat =
        (_ongoingRideController.ongoingRide?.endLat?.toDouble() ?? 00.00);

    ///todo:user end lang....

    final userendlang =
        (_ongoingRideController.ongoingRide?.endLong?.toDouble() ?? 00.00);

    print("startlat${usersatartlat}");
    print("endlat${usersatartlang}");

    print("endlang${userendlang}");
    print("endlat${userendlat}");

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        color: MyTheme.ambapp5,
        height: size.height,
        width: size.width,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   backgroundColor: MyTheme.ambapp5,
          //   elevation: 0,
          // ),
          body: SafeArea(
            child: Obx(
              () => (_ongoingRideController.isLoading.value)
                  ? const Center(child: CircularProgressIndicator())
                  : _ongoingRideController.ongoingRide?.patientName == null
                      ? const Center(
                          child: Text(
                            'No Data',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.02),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      height: size.height * 0.03,
                                      width: size.width * 0.1,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white70,
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios_outlined,
                                        size: size.height * 0.022,
                                        color: MyTheme.ambapp4,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    'Your are ready to go.',
                                    style: GoogleFonts.alatsi(
                                        fontSize: size.height * 0.022,
                                        fontWeight: FontWeight.w600,
                                        color: MyTheme.ambapp3),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            //Spacer(),

                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.0005),
                              child: Container(
                                height: size.height * 0.5,
                                margin: EdgeInsets.symmetric(vertical: 30 / 5),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                      fit: BoxFit.fill),
                                  //color: MyTheme.containercolor8,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(-0, -0),
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                      color: Colors.grey.shade100,

                                      // color: darkShadow1,
                                    ),
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                      blurRadius: 0,
                                      color: Colors.grey.shade200,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  height: size.height * 0.093,
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(
                                      vertical: size.width * 0.0 / 05),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xffF0F3F8),
                                            Color(0xffF0F3F8)
                                            //darkPrimary,
                                          ]),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(2, 2),
                                          spreadRadius: 1,
                                          blurRadius: 0,
                                          color: Colors.grey.shade200,
                                        ),
                                        BoxShadow(
                                          offset: Offset(2, 2),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          color: Colors.grey.shade500,
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.verified,
                                              color: MyTheme.containercolor17,
                                            ),
                                            Text(
                                              "${_ongoingRideController.ongoingRide?.patientName.toString()}",

                                              /// "Kumar Prince",
                                              // 'Kumar Prince',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: size.width * 0.06,
                                                fontWeight: FontWeight.w700,
                                                color: MyTheme.ambapp,
                                              ),
                                            ),
                                            Spacer(),

                                            ///images...
                                            Container(
                                              height: size.height * 0.12,
                                              width: size.width * 0.2,
                                              decoration: BoxDecoration(
                                                color: Colors.yellow.shade800,
                                                shape: BoxShape.circle,
                                                // image: DecorationImage(
                                                //   fit: BoxFit.fill,
                                                //   image: NetworkImage(
                                                //     "$base${_driverAcceptlistController.getDriveracceptDetail?.driverImage.toString()}",
                                                //     // 'https://wallpaperaccess.com/full/2440003.jpg'
                                                //   ),
                                                // )

                                                ///

                                                //Image.network(
                                                //                      base +
                                                //                                         '${_labreportviewController.labreportimage?.labViewReportFile?[index].file.toString()}',
                                              ),

                                              ///
                                              child: InkWell(
                                                onTap: () {
                                                  // MapUtils.openMap(
                                                  //     47.628293260721,
                                                  //     -122.34263420105);

                                                  ///todo:.........................................uuuuuu.....google map application open.......
                                                },
                                                child: Container(
                                                  height: size.height * 0.12,
                                                  width: size.width * 0.18,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black38),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ClipRect(
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          'https://images.unsplash.com/photo-1586293403445-ffa224197984?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                                                      // 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                                                      ,

                                                      ///base + '',
                                                      //'https://pbs.twimg.com/profile_images/945853318273761280/0U40alJG_400x400.jpg',
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        width: 90.0,
                                                        height: 90.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Mobile:',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: MyTheme.ambapp
                                                  //Color(0xff12BFC4),
                                                  ),
                                            ),
                                            // Icon(
                                            //   Icons
                                            //       .car_crash_sharp,
                                            //   size: size.height *
                                            //       0.02,
                                            //   color: Colors
                                            //       .grey.shade600,
                                            // ),
                                            SizedBox(
                                              width: size.width * 0.006,
                                            ),
                                            Center(
                                              child: Text(
                                                "${_ongoingRideController.ongoingRide?.mobileNumber.toString()}",

                                                //"934422221",
                                                //'2020 Honda Clive',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.014,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Total Distance:',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: MyTheme.ambapp),
                                            ),
                                            // Icon(
                                            //   Icons
                                            //       .car_crash_sharp,
                                            //   size: size.height *
                                            //       0.02,
                                            //   color: Colors
                                            //       .grey.shade600,
                                            // ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            Text(
                                              "${_ongoingRideController.ongoingRide?.totalDistance ?? 0} Km",

                                              // "10 km.",
                                              //'2020 Honda Clive',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.aBeeZee(
                                                fontSize: size.width * 0.04,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey.shade900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.015,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Total Price :',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.actor(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: MyTheme.ambapp),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            Text(
                                              "\u{20B9}${_ongoingRideController.ongoingRide?.totalPrice ?? 0.0}",

                                              //"100",
                                              // '121234333377',
                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                              style: GoogleFonts.roboto(
                                                fontSize: size.width * 0.04,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.grey.shade900,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.012,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.06,
                                              width: size.width * 0.28,
                                              child: Text(
                                                'User Location :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.06,
                                              width: size.width * 0.45,
                                              child: Center(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "${_ongoingRideController.ongoingRide?.pickupLocation.toString() ?? 00}",

                                                    //"100",
                                                    // '121234333377',
                                                    //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                    style: GoogleFonts.roboto(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.grey.shade900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            ///start location.......
                                            SizedBox(
                                              height: size.height * 0.065,
                                              width: size.width * 0.14,
                                              child: ElevatedButton(
                                                child: Center(
                                                  child: SizedBox(
                                                    height: size.height * 0.065,
                                                    width: size.width * 0.14,
                                                    child: Icon(
                                                      Icons.navigation,
                                                      color: Colors.white,
                                                      size: 19,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title:
                                                            Text("Meet User"),
                                                        content: Text(
                                                            "Reach Your Pickup Location"),
                                                        actions: [
                                                          ElevatedButton(
                                                            child: SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.21,
                                                              child: Text(
                                                                "   Cancel   ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .red,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    textStyle: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          Spacer(),
                                                          ElevatedButton(
                                                            child: Text(
                                                              "Track User",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary: Colors
                                                                        .green,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    textStyle: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                            onPressed:
                                                                () async {
                                                              await _ongoingRideController
                                                                  .ongoingRideApi();
                                                              _ongoingRideController
                                                                  .onInit();
                                                              _ongoingRideController
                                                                  .update();

                                                              ///tod: notification....
                                                              SharedPreferences
                                                                  prefs =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              CallLoader
                                                                  .loader();
                                                              await Future.delayed(
                                                                  Duration(
                                                                      milliseconds:
                                                                          500));
                                                              CallLoader
                                                                  .hideLoader();
                                                              //driacceptrejectlistid
                                                              //prefs.setString("driacceptrejectlistid", "${_driverRequestListController.getDriverRequestList?.userListForBookingAmbulance?[index].id}");
                                                              // prefs.setString("driveracceptrjctDeviceid", "${_driverRequestListController.getDriverRequestList?.userListForBookingAmbulance?[index].deviceId}");

                                                              print(
                                                                  'princee notification');
                                                              notificationServices
                                                                  .getDeviceToken()
                                                                  .then(
                                                                      (value) async {
                                                                var data = {
                                                                  //this the particular device id.....
                                                                  'to':
                                                                      "${_ongoingRideController.ongoingRide?.deviceId}",

                                                                  //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                                  //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                                  //.toString(),

                                                                  ///this is same device token....
                                                                  //value
                                                                  //.toString(),
                                                                  'notification':
                                                                      {
                                                                    'title':
                                                                        'Ambrd driver',
                                                                    'body':
                                                                        'Your Driver is coming',
                                                                    //"sound": "jetsons_doorbell.mp3"
                                                                  },
                                                                  'android': {
                                                                    'notification':
                                                                        {
                                                                      'notification_count':
                                                                          23,
                                                                    },
                                                                  },
                                                                  'data': {
                                                                    'type':
                                                                        'comingride_case',
                                                                    'id':
                                                                        '12334'
                                                                  }
                                                                };
                                                                print(
                                                                    "dataccept:${data}");

                                                                await http.post(
                                                                    Uri.parse(
                                                                        'https://fcm.googleapis.com/fcm/send'),
                                                                    body: jsonEncode(
                                                                        data),
                                                                    headers: {
                                                                      'Content-Type':
                                                                          'application/json; charset=UTF-8',
                                                                      'Authorization':
                                                                          'key=AAAAbao_0RU:APA91bFNp9i75TwjvU16WgWfPltmSZS4RLdHKCXmk93D5RBLXBSmI2ArbPbd4mcSvNaN8w_A-JuERFWLHf00NkRannNN4dJBR_ok3SkDM_erMRYUUUZChujPJXJK8-MFmxtN23Vodtyv'

                                                                      // 'Authorization': 'key=AAAAp6CyXz4:APA91bEKZ_ArxpUWyMYnP8Do3oYrgXFVdNm2jQk-i1DjKcR8duPeccS64TohP-OAqxL57-840qWe0oeYDBAOO68-aOO2z9EWIcBbUIsXc-3kA5usYMviDYc_wK6qMsQecvAdM54xfZsO'
                                                                      //'AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                                    }).then(
                                                                    (value) {
                                                                  if (kDebugMode) {
                                                                    print(
                                                                        "princedriver${value.body.toString()}");
                                                                  }
                                                                }).onError((error,
                                                                    stackTrace) {
                                                                  if (kDebugMode) {
                                                                    print(
                                                                        error);
                                                                  }
                                                                });
                                                              });

                                                              ///todo: open google map and reache to ride.........start..

                                                              await MapUtils.openMap(
                                                                  usersatartlat,
                                                                  usersatartlang);

                                                              ///todo: open google map and reached ride.......end..
                                                              ///
                                                              ///todo: motification.....

                                                              ///
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.green,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  // textStyle: TextStyle(
                                                  //     fontSize: 15,
                                                  //     fontWeight:
                                                  //         FontWeight.bold)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),

                                        SizedBox(
                                          height: size.height * 0.025,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.06,
                                              width: size.width * 0.28,
                                              child: Text(
                                                'Drop Location :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp),
                                              ),
                                            ),
                                            SizedBox(
                                              height: size.height * 0.06,
                                              width: size.width * 0.45,
                                              child: Center(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "${_ongoingRideController.ongoingRide?.dropLocation.toString() ?? 00}",
                                                    //"100",
                                                    // '121234333377',
                                                    //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                    style: GoogleFonts.roboto(
                                                      fontSize:
                                                          size.width * 0.03,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          Colors.grey.shade900,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            ///drop: navigation.
                                            SizedBox(
                                              height: size.height * 0.065,
                                              width: size.width * 0.14,
                                              child: ElevatedButton(
                                                child: Center(
                                                  child: SizedBox(
                                                    height: size.height * 0.065,
                                                    width: size.width * 0.14,
                                                    child: Icon(
                                                      Icons.navigation,
                                                      color: Colors.white,
                                                      size: 19,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            "Start Your Ride"),
                                                        content: Text(
                                                            "Enjoy your journey All The Best!"),
                                                        actions: [
                                                          ElevatedButton(
                                                            child: SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.21,
                                                              child: Text(
                                                                "   Cancel   ",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .red,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    textStyle: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          Spacer(),
                                                          ElevatedButton(
                                                            child: Text(
                                                              "Start Ride! ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary: Colors
                                                                        .green,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    textStyle: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                            onPressed:
                                                                () async {
                                                              // await _ongoingRideController
                                                              //     .ongoingRideApi();
                                                              // _ongoingRideController
                                                              //     .onInit();
                                                              // _ongoingRideController
                                                              //     .update();

                                                              ///todo: open google map and reache to ride.........start..

                                                              await MapUtils
                                                                  .openMap(
                                                                      userendlat,
                                                                      userendlang);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  await _ongoingRideController
                                                      .ongoingRideApi();
                                                  _ongoingRideController
                                                      .onInit();
                                                  _ongoingRideController
                                                      .update();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  // textStyle: TextStyle(
                                                  //     fontSize: 15,
                                                  //     fontWeight:
                                                  //         FontWeight.bold)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        //wallet
                                        ///neopop....button...both...
                                        // Row(
                                        //   children: [
                                        //     ///payamoutnt.......mdeet user....
                                        //     /////finalamtdriver
                                        //     SizedBox(
                                        //       height: size.height * 0.05,
                                        //       width: size.width * 0.35,
                                        //       child: NeoPopButton(
                                        //         color: Colors.deepOrangeAccent,
                                        //         bottomShadowColor: ColorUtils
                                        //                 .getVerticalShadow(
                                        //                     Colors.orange
                                        //                         .shade300)
                                        //             .toColor(),
                                        //         rightShadowColor: ColorUtils
                                        //                 .getHorizontalShadow(
                                        //                     Colors.orange
                                        //                         .shade300)
                                        //             .toColor(),
                                        //         //animationDuration: kButtonAnimationDuration,
                                        //         depth: kButtonDepth,
                                        //         onTapUp: () async {
                                        //           ///todo: from here  lat id via share preference........................................
                                        //
                                        //           SharedPreferences prefs =
                                        //               await SharedPreferences
                                        //                   .getInstance();
                                        //           await prefs.setString(
                                        //               "StartLatuser",
                                        //               "${_ongoingRideController.ongoingRide?.startLat ?? 0.0}");
                                        //           await SharedPreferences
                                        //               .getInstance();
                                        //           prefs.setString(
                                        //               "StartLanguser",
                                        //               "${_ongoingRideController.ongoingRide?.startLong ?? 0.0}");
                                        //           // print(
                                        //           ///todo: open google map and reache to ride.........start..
                                        //
                                        //           MapUtils.openMap(
                                        //               usersatartlat,
                                        //               usersatartlang);
                                        //
                                        //           ///todo: open google map and reached ride.......end..
                                        //         },
                                        //         border: Border.all(
                                        //           color:
                                        //               Colors.deepOrangeAccent,
                                        //           width: 3,
                                        //         ),
                                        //         child: Padding(
                                        //           padding: const EdgeInsets
                                        //                   .symmetric(
                                        //               horizontal: 0,
                                        //               vertical: 0),
                                        //           child: Row(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment
                                        //                     .center,
                                        //             children: const [
                                        //               Text("Meet User",
                                        //                   style: TextStyle(
                                        //                     color: Colors.white,
                                        //                     fontSize: 17,
                                        //                     fontWeight:
                                        //                         FontWeight.bold,
                                        //                   )),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //     Spacer(),
                                        //     SizedBox(
                                        //       height: size.height * 0.05,
                                        //       width: size.width * 0.35,
                                        //       child: NeoPopButton(
                                        //         color: Colors.indigoAccent,
                                        //         bottomShadowColor: ColorUtils
                                        //                 .getVerticalShadow(
                                        //                     Colors.indigoAccent
                                        //                         .shade200)
                                        //             .toColor(),
                                        //         rightShadowColor: ColorUtils
                                        //                 .getHorizontalShadow(
                                        //                     Colors.indigo
                                        //                         .shade100)
                                        //             .toColor(),
                                        //         //animationDuration: kButtonAnimationDuration,
                                        //         depth: kButtonDepth,
                                        //         onTapUp: () async {
                                        //           ///end lat...
                                        //           SharedPreferences p =
                                        //               await SharedPreferences
                                        //                   .getInstance();
                                        //           p.setString("endlat1",
                                        //               "${_ongoingRideController.ongoingRide?.endLat ?? 0.0}");
                                        //           var endLAtnew =
                                        //               p.getString("endlat1");
                                        //           print(
                                        //               "endlattt:${endLAtnew}");
                                        //
                                        //           ///end lang...
                                        //           SharedPreferences ps =
                                        //               await SharedPreferences
                                        //                   .getInstance();
                                        //           ps.setString("endlang1",
                                        //               "${_ongoingRideController.ongoingRide?.endLong ?? 0.0}");
                                        //           var endLANGnew =
                                        //               ps.getString("endlang1");
                                        //           print(
                                        //               "endlangt:${endLANGnew}");
                                        //
                                        //           SharedPreferences prefs =
                                        //               await SharedPreferences
                                        //                   .getInstance();
                                        //           await prefs.setString(
                                        //               "StartLatuser",
                                        //               "${_ongoingRideController.ongoingRide?.startLat ?? 0.0}");
                                        //           await SharedPreferences
                                        //               .getInstance();
                                        //           prefs.setString(
                                        //               "StartLanguser",
                                        //               "${_ongoingRideController.ongoingRide?.startLong ?? 0.0}");
                                        //
                                        //           ///todo: open google map and start ride.........start..
                                        //
                                        //           MapUtils.openMap(
                                        //               userendlat, userendlang);
                                        //
                                        //           ///todo: open google map and start ride.......end..
                                        //         },
                                        //         border: Border.all(
                                        //           color: Colors.indigoAccent,
                                        //           width: 3,
                                        //         ),
                                        //         child: Padding(
                                        //           padding: const EdgeInsets
                                        //                   .symmetric(
                                        //               horizontal: 0,
                                        //               vertical: 0),
                                        //           child: Row(
                                        //             mainAxisAlignment:
                                        //                 MainAxisAlignment
                                        //                     .center,
                                        //             children: const [
                                        //               Text("Start Ride",
                                        //                   style: TextStyle(
                                        //                     color: Colors.white,
                                        //                     fontSize: 17,
                                        //                     fontWeight:
                                        //                         FontWeight.bold,
                                        //                   )),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.0,
                            ),
                            //Spacer(),

                            //)
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }
}

///

// class MessageScreen1 extends StatefulWidget {
//   final String id;
//   const MessageScreen({Key? key, required this.id}) : super(key: key);
//
//   @override
//   State<MessageScreen> createState() => _MessageScreenState();
// }
//
// class _MessageScreenState extends State<MessageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Message Screen' + widget.id),
//       ),
//     );
//   }
// }

///todo:here google map function.......
class MapUtils {
  MapUtils._();
  static Future<void> openMap(
    double latitude,
    double longitude,
  ) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could not open the map';
    }
  }
}
