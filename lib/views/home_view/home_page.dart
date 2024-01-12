import 'dart:async';
import 'dart:convert';

import 'package:ambrd_driver_app/controllers/booking_request_list_controller.dart';
import 'package:ambrd_driver_app/controllers/ongoing_ride_controller.dart';
import 'package:ambrd_driver_app/views/drowerr_user/booking_driver_history.dart';
import 'package:ambrd_driver_app/views/drowerr_user/driver_drawer.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/payment_history.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/payout_history.dart';
import 'package:ambrd_driver_app/views/drowerr_user/page_drower/support_page.dart';
import 'package:ambrd_driver_app/views/firebase_notificationss/firebase_notification_servc.dart';
import 'package:ambrd_driver_app/views/firebase_notificationss/local_notifications.dart';
import 'package:ambrd_driver_app/views/home_view/booking_list.dart';
import 'package:ambrd_driver_app/views/home_view/ongoing_ride.dart';
import 'package:ambrd_driver_app/views/home_view/update_locations.dart';
import 'package:ambrd_driver_app/widget/circular_loader.dart';
import 'package:ambrd_driver_app/widget/exit_popscope.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../constantsss/app_theme/app_color.dart';
import '../../controllers/home_controllers.dart';
import '../../controllers/swith_toogle_controller/toogle_switch_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();

  DriverRequestListController _driverRequestListController =
      Get.put(DriverRequestListController());

  OngoingRideController _ongoingRideController =
      Get.put(OngoingRideController());

  SwitchX tooglecontroller = Get.put(SwitchX());

  String DriverId = ''.toString();

  String AdminLogin_Id = ''.toString();

  bool isSwitched = false;

  var textValue = 'You are offline';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'True';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'False';
      });
      print('Switch Button is OFF');
    }
  }

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();
    //todo:to...................
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

        ///todo:.................
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

          ///you can call local notification.............................

          LocalNotificationService.createanddisplaynotification(message);

          ///you can call local notification....................................

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

  final List<String> productname = [
    'Invoice',
    'Add Technician',
    'Profile',
    'Complaint List',
    'Customer Support',
    'Add Services',
  ];

  final List<String> productname2 = [
    'Booking List',
    'Ongoing Ride',
    'Payment History',
    'Payout History',
    'Booking History',
    'Contact us',
  ];

  final List<String> productimage = [
    'lib/assets/customer.png',
    'lib/assets/travel-insurance.png',
    'lib/assets/transaction-history (1).png',
    'lib/assets/atm-machine.png',
    'lib/assets/time.png',
    'lib/assets/contact-information.png',
    // 'service 7',
    // 'service 8',
  ];

  final List<IconData> producticons = [
    Icons.request_page_rounded,
    Icons.request_quote_outlined,
    Icons.cases,
    Icons.share_outlined,
    Icons.home_work,
    Icons.holiday_village,
    // Icons.card_giftcard_outlined,
    // Icons.card_membership,
  ];

  final List<IconData> product1icons = [
    Icons.logout,
    Icons.backpack,
    Icons.email_outlined,
    Icons.payment,
  ];

  final List<String> productname1 = [
    'Logout',
    'Voucher',
    'Feedback',
    'Support',
  ];

  // _launchURLBrowser() async {
  @override
  Widget build(BuildContext context) {
    // Instantiate Get Controller, *in* build()

    Size size = MediaQuery.of(context).size;
    int pageIndex = 0;
    GlobalKey<ScaffoldState> _key = GlobalKey();

    ///var base = 'https://api.gyros.farm/Images/';
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        key: _key,
        //backgroundColor: MyTheme.ambapp1,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: MyTheme.ambapp5,
          automaticallyImplyLeading: false,
          title: Container(
            height: size.height * 0.085,
            width: size.width * 0.19,
            child: Image.asset(
              'lib/assets/DriverPlaystore.png',
              fit: BoxFit.cover,
              //scale: 32,
            ),
          ),
          actions: [
            SizedBox(
              height: 30,
              // width: 30,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Obx(() => Text('You are: ${tooglecontroller.on}')),
                    Obx(
                      () => Transform.scale(
                        scale: 1.3,
                        child: Switch(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (val) async {
                            notificationServices
                                .getDeviceToken()
                                .then((value) async {
                              var data = {
                                //this the particular device id.....
                                'to':
                                    //this is dummy token...
                                    "ugug6t878",

                                ///todo device token......
                                // widget
                                //     .driverlist
                                //     ?.message?[
                                //         index]
                                //     .id
                                //     .toString(),
                                ///
                                //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                //.toString(),

                                ///this is same device token....
                                //value.toString(),
                                'notification': {
                                  'title': 'Ambrd Driver',
                                  'body': 'You have request for ambulance',
                                  //"sound": "jetsons_doorbell.mp3"
                                },
                                'android': {
                                  'notification': {
                                    'notification_count': 23,
                                  },
                                },
                                'data': {'type': 'msj', 'id': '123456'}
                              };

                              await http.post(
                                  Uri.parse(
                                      'https://fcm.googleapis.com/fcm/send'),
                                  body: jsonEncode(data),
                                  headers: {
                                    'Content-Type':
                                        'application/json; charset=UTF-8',
                                    'Authorization':
                                        //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                        'key=AAAAp6CyXz4:APA91bEKZ_ArxpUWyMYnP8Do3oYrgXFVdNm2jQk-i1DjKcR8duPeccS64TohP-OAqxL57-840qWe0oeYDBAOO68-aOO2z9EWIcBbUIsXc-3kA5usYMviDYc_wK6qMsQecvAdM54xfZsO'
                                    // 'AAAAp6CyXz4:APA91bGPkLfnMIlQQJRVMqHmqSAghl0cL0MqtI2oJugrPTgBRO-Ps1VJh0TtQr9Hjx5WdAkRbzLLNhLIvWrUFhJHHFvwGyGwKyyNOVCmukeL3JDSgK2IoextNQ_3r5rM557EuiKwgEFE'
                                    //'AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                  }).then((value) {
                                if (kDebugMode) {
                                  print(value.body.toString());
                                }
                              }).onError((error, stackTrace) {
                                if (kDebugMode) {
                                  print(error);
                                }
                              });

                              ///todo: from here custom from backend start...
                              var prefs = GetStorage();

                              //prefs.write("AdminLogin_Id".toString(), json.decode(r.body)['data']['AdminLogin_Id']);
                              AdminLogin_Id =
                                  prefs.read("AdminLogin_Id").toString();
                              print(
                                  '&&&&&&&&&&&&&&&&&&&&admin:${AdminLogin_Id}');

                              ///.............................................................................
                              DriverId = prefs.read("DriverId").toString();
                              print(
                                  '&&&&&&&&&&&&&&&&&&&&&&driverrcredentials:${DriverId}');
                              var body = {
                                "AdminLoginId": "${AdminLogin_Id}",
                                "DeviceId": value.toString(),
                              };
                              print("userrrtokenupdateeeddbeforetttt${body}");
                              http.Response r = await http.post(
                                Uri.parse(
                                    'http://admin.ambrd.in/api/CommonApi/UpdateDeviceId'),
                                body: body,
                              );

                              print(r.body);
                              if (r.statusCode == 200) {
                                print("userrrtokenupdatdricvfe3333${body}");
                                return r;
                              } else if (r.statusCode == 401) {
                                Get.snackbar('message', r.body);
                              } else {
                                Get.snackbar('Error', r.body);
                                return r;
                              }

                              ///todo end post api from backend...
                            });

                            ///todo: other apis...
                            await _driverRequestListController
                                .driverRequestListApi();
                            _driverRequestListController.onInit();
                            tooglecontroller.toggle();
                            await tooglecontroller.ToogleStatusApi();

                            // setState(() {
                            //   gender = value.toString();
                            // });
                          },

                          ///onChanged: (val) => tooglecontroller.toggle(),
                          value: tooglecontroller.on.value,
                          activeColor: Colors.green.shade300,
                          activeTrackColor: Colors.green,
                          inactiveThumbColor: Colors.grey.shade300,
                          inactiveTrackColor: Colors.grey,
                        ),
                      ),
                    )
                    // Transform.scale(
                    //     scale: 1,
                    //     child: Switch(
                    //       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //       onChanged: toggleSwitch,
                    //       value: isSwitched,
                    //       activeColor: Colors.green.shade800,
                    //       activeTrackColor: Colors.green,
                    //       inactiveThumbColor: Colors.red,
                    //       inactiveTrackColor: Colors.grey,
                    //     )),
                    // Text(
                    //   textValue,
                    //   style: TextStyle(fontSize: 10),
                    // )
                  ]),
            ),
            PopupMenuButton(
                color: MyTheme.ambapp3,
                icon: Icon(Icons.more_vert, color: Colors.white),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Update Location"),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Complete Ride"),
                    ),
                  ];
                },
                onSelected: (value) async {
                  if (value == 0) {
                    CircularProgressIndicator();
                    print('princee notification');
                    await _ongoingRideController.ongoingRideApi();
                    _ongoingRideController.update();
                    _ongoingRideController.onInit();

                    notificationServices.getDeviceToken().then((value) async {
                      var data = {
                        //this the particular device id.....
                        'to':
                            //this is dummy token...
                            "ugug6t878",

                        ///todo device token......
                        // widget
                        //     .driverlist
                        //     ?.message?[
                        //         index]
                        //     .id
                        //     .toString(),
                        ///
                        //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                        //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                        //.toString(),

                        ///this is same device token....
                        //value.toString(),
                        'notification': {
                          'title': 'Ambrd Driver',
                          'body': 'You have request for ambulance',
                          //"sound": "jetsons_doorbell.mp3"
                        },
                        'android': {
                          'notification': {
                            'notification_count': 23,
                          },
                        },
                        'data': {'type': 'msj', 'id': '123456'}
                      };

                      await http.post(
                          Uri.parse('https://fcm.googleapis.com/fcm/send'),
                          body: jsonEncode(data),
                          headers: {
                            'Content-Type': 'application/json; charset=UTF-8',
                            'Authorization':
                                //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                'key=AAAAp6CyXz4:APA91bEKZ_ArxpUWyMYnP8Do3oYrgXFVdNm2jQk-i1DjKcR8duPeccS64TohP-OAqxL57-840qWe0oeYDBAOO68-aOO2z9EWIcBbUIsXc-3kA5usYMviDYc_wK6qMsQecvAdM54xfZsO'
                            // 'AAAAp6CyXz4:APA91bGPkLfnMIlQQJRVMqHmqSAghl0cL0MqtI2oJugrPTgBRO-Ps1VJh0TtQr9Hjx5WdAkRbzLLNhLIvWrUFhJHHFvwGyGwKyyNOVCmukeL3JDSgK2IoextNQ_3r5rM557EuiKwgEFE'
                            //'AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                          }).then((value) {
                        if (kDebugMode) {
                          print(value.body.toString());
                        }
                      }).onError((error, stackTrace) {
                        if (kDebugMode) {
                          print(error);
                        }
                      });

                      ///todo: from here custom from backend start...
                      var prefs = GetStorage();

                      //prefs.write("AdminLogin_Id".toString(), json.decode(r.body)['data']['AdminLogin_Id']);
                      AdminLogin_Id = prefs.read("AdminLogin_Id").toString();
                      print('&&&&&&&&&&&&&&&&&&&&admin:${AdminLogin_Id}');

                      ///.............................................................................
                      DriverId = prefs.read("DriverId").toString();
                      print(
                          '&&&&&&&&&&&&&&&&&&&&&&driverrcredentials:${DriverId}');
                      var body = {
                        "AdminLoginId": "${AdminLogin_Id}",
                        "DeviceId": value.toString(),
                      };
                      print("userrrtokenupdateeeddbeforetttt${body}");
                      http.Response r = await http.post(
                        Uri.parse(
                            'http://admin.ambrd.in/api/CommonApi/UpdateDeviceId'),
                        body: body,
                      );
                      print(r.body);
                      if (r.statusCode == 200) {
                        print("userrrtokenupdatdricvfe3333${body}");
                        return r;
                      } else if (r.statusCode == 401) {
                        Get.snackbar('message', r.body);
                      } else {
                        Get.snackbar('Error', r.body);
                        return r;
                      }

                      ///todo end post api from backend...
                    });

                    ///end....
                    ///
                    await Get.to(MyLocation());

                    ///print("My account menu is selected.");
                  } else if (value == 2) {
                    //CircularProgressIndicator();
                    CallLoader.loader();
                    await Future.delayed(Duration(milliseconds: 500));
                    CallLoader.hideLoader();

                    await _ongoingRideController.ongoingRideApi();
                    _ongoingRideController.update();
                    _ongoingRideController.onInit();
                    await Get.to(MyLocation());

                    // _homePageController.logout();
                    //print("logout");
                  }
                }),
          ],
          // actions: [
          //   IconButton(onPressed: (){
          //     _homePageController.logout();
          //   },
          //     icon: Icon(Icons.logout),color: Colors.black,)
          // ],
          leading: InkWell(
              onTap: () {
                /// Get.to(LoginEmailPage());
                _key.currentState!.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ),

        drawer: MainAmbrbdriverDrawer(),
        //MainDrawer(),
        body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            color: MyTheme.ambapp3,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.25,
                  width: size.width,
                  color: Colors.blue,
                  child: Mycrusial(),
                ),
                Expanded(
                  flex: 2,
                  child: GridView.builder(
                      shrinkWrap: true,
                      //physics: ScrollPhysics(),
                      //physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          //childAspectRatio: 5 / 2,

                          childAspectRatio: 4 / 3.1,
                          mainAxisExtent: size.height * 0.1835,
                          crossAxisSpacing: 1.5,
                          mainAxisSpacing: 2.5),
                      itemCount: 6,
                      // _homePageController
                      //     .getcatagartlist!.result!.length,
                      //items?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return
                            // Obx(
                            //     () => (_homePageController.isLoading.value)
                            //     ? Center(child: CircularProgressIndicator())
                            //     : _homePageController
                            //     .getcatagartlist!.result!.isEmpty
                            //     ? Center(
                            //   child: Text('No List'),
                            // )
                            //     :
                            Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.006,
                              vertical: size.height * 0.002),
                          child: InkWell(
                            onTap: () async {
                              // Get.to(LoginEmailPage());
                              //_homePageController.toggle(index);
                              if (index == 0) {
                                /// periodicTimer()
                                await _driverRequestListController
                                    .driverRequestListApi();
                                _driverRequestListController.onInit();
                                CallLoader.loader();
                                await Future.delayed(
                                    Duration(milliseconds: 500));
                                CallLoader.hideLoader();
                                await Get.to(() => MessageScreen(id: "123456"));
                                // await accountService.getAccountData
                                //     .then((accountData) {
                                //   Timer(
                                //     const Duration(milliseconds: 100),
                                //     () {
                                //       await Get.to(
                                //           () => BookingListUser(id: "123456"));
                                //
                                //       ///  Get.to(DriverHomePage());
                                //       ///  8 dec 2023
                                //       // _viewhealthchkpreviewController.healthreviewratingApi();
                                //       //_viewhealthchkpreviewController.update();
                                //       // Get.snackbar(
                                //       //     'Add review Successfully', "Review Submitted. Thank-you."
                                //       //   // "${r.body}"
                                //       // );
                                //       //Get.to(() => CheckupSchedulePage());
                                //       //Get.to((page))
                                //       ///
                                //     },
                                //   );
                                //});
                                //Get.to(() => BestSeller());
                                //Get.to(() => WaterTracking());
                              } else if (index == 1) {
                                await _ongoingRideController.ongoingRideApi();
                                _ongoingRideController.onInit();
                                _ongoingRideController.update();
                                CallLoader.loader();
                                await Future.delayed(
                                    Duration(milliseconds: 300));
                                CallLoader.hideLoader();
                                await Get.to(
                                    () => OngoingRideTracking(id: "1233"));

                                ///OngoingRideTracking.............................

                                //Get.to(() => CatagaryListSubcatagary());
                              } else if (index == 2) {
                                await Get.to(() => DriverPaymentHistory());
                                //Get.to(() => WalkTracking());
                              } else if (index == 3) {
                                await Get.to(() => DriverPayoutHistory());
                                //Get.to(() => Oil());
                              } else if (index == 4) {
                                ///................///.............

                                await Get.to(() => DriverBookingHistory());
                                //Get.to(() => WalkTracking());
                              } else if (index == 5) {
                                await Get.to(() => SupportViewAmbrdComman());

                                //Get.to(() => Honey());
                                //Get.to(() => WalkTracking());
                              } else if (index == 6) {
                                //Get.to(() => Pulses());
                                //Get.to(() => WalkTracking());
                              } else if (index == 7) {
                                //Get.to(() => Sattu());
                                //Get.to(() => WalkTracking());
                              } else if (index == 8) {
                                //Get.to(() => CupponsPage());
                              } else if (index == 9) {
                                // Get.to(() => GiftBox());

                                //Get.to(() => WalkTracking());
                              } else if (index == 10) {
                                //Get.to(() => Sweets());
                                //Get.to(() => BestSeller());
                                //Get.to(() => WalkTracking());
                              } else if (index == 11) {
                                // Get.to(() => Jeggary());
                                //Get.to(() => WalkTracking());
                              }
                            },
                            child: PhysicalModel(
                              borderRadius: BorderRadius.circular(5),
                              color: MyTheme.ambapp2,
                              // _homePageController
                              //     .selectedIndex
                              //     .value ==
                              //     index
                              //     ? MyTheme.containercolor7
                              //     : MyTheme.containercolor7,

                              //: Color(0xffeff8f5),
                              elevation: 0.1,
                              child: Container(
                                height: size.height * 0.09,
                                width: size.width * 0.09,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: MyTheme.ambapp5,
                                    border: Border.all(color: Colors.red)
                                    // _homePageController
                                    //     .selectedIndex
                                    //     .value ==
                                    //     index
                                    //     ? Colors.white12
                                    //     : Colors.white12,
                                    ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: PhysicalModel(
                                        color: Colors.red.shade900,
                                        borderRadius: BorderRadius.circular(10),
                                        elevation: 30,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            height: size.height * 0.12,
                                            width: size.width * 0.30,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      productimage[index],
                                                      //"https://images.unsplash.com/photo-1502740479091-635887520276?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80",
                                                    ),
                                                    fit: BoxFit.fitHeight)),

                                            ///todo:error....weight...
                                            // child:
                                            // Image.network(
                                            //   "https://images.unsplash.com/photo-1502740479091-635887520276?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80"
                                            //   // base +
                                            //   //'${_homePageController.getcatagartlist!.result![index].imageName.toString()}'
                                            //   ,
                                            //   fit: BoxFit.cover,
                                            //   errorBuilder:
                                            //       (context, error, stackTrace) {
                                            //     //if image not comming in catagary then we have to purchase
                                            //
                                            //     return Icon(
                                            //       Icons.error,
                                            //       color: Colors.grey,
                                            //     );
                                            //   },
                                            //
                                            //   height: size.height * 0.056,
                                            //   width: size.width * 0.15,
                                            //   // color: _homePageController
                                            //   //             .selectedIndex
                                            //   //             .value ==
                                            //   //         index
                                            //   //     ? Colors.white
                                            //   //     : MyTheme.ThemeColors
                                            // ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                        child: SizedBox(
                                      //width: size.width * 0.25,
                                      child: Center(
                                        child: Container(
                                          height: size.height * 0.025,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5)),
                                          ),
                                          child: Center(
                                            child: Text(
                                              productname2[index]
                                              // _homePageController
                                              //     .getcatagartlist!
                                              //     .result![index]
                                              //     .categoryName
                                              //     .toString()
                                              ,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 11,
                                                color: Colors.blue.shade900,

                                                //.ContainerUnSelectedColor
                                                // _homePageController
                                                //             .selectedIndex
                                                //             .value ==
                                                //         index
                                                //     ? MyTheme.ThemeColors
                                                //     : MyTheme.ThemeColors
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );

                        /// );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Mycrusial extends StatelessWidget {
  final _sliderKey = GlobalKey();
  HomeController _homePageController = Get.put(HomeController());
  Mycrusial({Key? key}) : super(key: key);

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final List<String> images = [
    "https://images.unsplash.com/photo-1588321421727-f807ae7da8a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2067&q=80",
    "https://images.unsplash.com/photo-1590125234767-5aecaa98c228?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1570244921736-115b00e074f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEwfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1581004705471-d5177239ab1f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=600&q=60",
    // "https://images.unsplash.com/photo-1513366884929-f0b3bedfb653?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    //"https://images.unsplash.com/photo-1577801622187-9a1076d049da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    //"https://images.unsplash.com/photo-1615870123253-f3de8aa89e24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXxjVlFHYWlJSTI3OHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  ];
  final bool _isPlaying = true;

  ///final img = 'https://ambrdapi.ndinfotech.com/Images/';
  final img = 'http://admin.ambrd.in/Images/';

  //get _sliderKey => null;

  @override
  Widget build(BuildContext context) {
    // var base = 'https://api.gyros.farm/Images/';
    ///var base = 'https://ambrdapi.ndinfotech.com/Images/';
    //....
    Size size = MediaQuery.of(context).size;
    //........
    return Scaffold(
      body: Obx(
        () => (_homePageController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _homePageController.getsliderbaner?.banner == null
                ? Center(
                    child: Text('No Image'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: size.height * 0.28,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Material(
                          color: MyTheme.ambapp,
                          borderRadius: BorderRadius.circular(10),
                          elevation: 0,
                          child: CarouselSlider.builder(
                            key: _sliderKey,
                            unlimitedMode: true,
                            autoSliderTransitionTime: Duration(seconds: 1),
                            slideBuilder: (index) {
                              var items =
                                  _homePageController.getsliderbaner?.banner;
                              return Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Material(
                                  elevation: 12,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: size.height * 38,
                                    width: size.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.white, width: 3),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '$img${items?[index].bannerImage}' ??
                                                  ''),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              );
                            },
                            slideTransform: DefaultTransform(),
                            slideIndicator: CircularSlideIndicator(
                              indicatorBorderWidth: 2,
                              indicatorRadius: 4,
                              itemSpacing: 15,
                              currentIndicatorColor: Colors.white,
                              padding: EdgeInsets.only(bottom: 0),
                            ),
                            itemCount: _homePageController
                                .getsliderbaner!.banner.length,
                            enableAutoSlider: true,
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
