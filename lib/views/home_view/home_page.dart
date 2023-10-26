import 'package:ambrd_driver_app/views/drowerr_user/driver_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../constantsss/app_theme/app_color.dart';
import '../../controllers/home_controllers.dart';
import '../../controllers/swith_toogle_controller/toogle_switch_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;

  var textValue = 'You are offline';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'ONLINE';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'OFFLINE';
      });
      print('Switch Button is OFF');
    }
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
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
    'Product 5',
    'Product 6',
  ];

  final List<String> productimage = [
    'lib/assets/images/invoice.png',
    'lib/assets/images/add-user.png',
    'lib/assets/images/profile.png',
    'lib/assets/images/complaint.png',
    'lib/assets/images/support1.png',
    'lib/assets/images/cloud-computing.png',
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
    SwitchX tooglecontroller =
        Get.put(SwitchX()); // Instantiate Get Controller, *in* build()

    Size size = MediaQuery.of(context).size;
    int pageIndex = 0;
    GlobalKey<ScaffoldState> _key = GlobalKey();
    var base = 'https://api.gyros.farm/Images/';
    return Scaffold(
      key: _key,
      //backgroundColor: MyTheme.ambapp1,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: MyTheme.t22Iconcolor,
        automaticallyImplyLeading: false,
        title: Container(
          height: size.height * 0.1,
          width: size.width * 0.17,
          child: Image.asset(
            'assets/logo222.png',
            fit: BoxFit.cover,
            //scale: 32,
          ),
        ),
        actions: [
          SizedBox(
            height: 30,
            // width: 30,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Obx(() => Text('You are: ${tooglecontroller.on}')),
              Obx(
                () => Transform.scale(
                  scale: 1.3,
                  child: Switch(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (val) => tooglecontroller.toggle(),
                    value: tooglecontroller.on.value,
                    activeColor: Colors.green.shade800,
                    activeTrackColor: Colors.green,
                    inactiveThumbColor: Colors.red,
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
                    child: Text("Complete Ride"),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text("Update Location"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  // Get.to(AddBanner());
                  print("My account menu is selected.");
                } else if (value == 1) {
                  // _homePageController.logout();
                  print("logout");
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.25,
                  width: size.width,
                  color: Colors.blue,
                  child: Mycrusial(),
                ),

                SizedBox(
                  //height: size.height * 0.36,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 5 / 2,
                          mainAxisExtent: size.height * 0.15,
                          crossAxisSpacing: 2.5,
                          mainAxisSpacing: 3),
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
                            onTap: () {
                              // Get.to(LoginEmailPage());
                              //_homePageController.toggle(index);
                              if (index == 0) {
                                // Get.to(() => CatagaryListSubcatagary());
                                //Get.to(() => BestSeller());
                                //Get.to(() => WaterTracking());
                              } else if (index == 1) {
                                //Get.to(() => CatagaryListSubcatagary());
                              } else if (index == 2) {
                                // Get.to(() => CowGhee());
                                //Get.to(() => WalkTracking());
                              } else if (index == 3) {
                                //Get.to(() => Oil());
                              } else if (index == 4) {
                                //Get.to(() => Spices());
                                //Get.to(() => WalkTracking());
                              } else if (index == 5) {
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
                                height: size.height * 0.1,
                                width: size.width * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: MyTheme.ambapp,
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
                                    Container(
                                      height: size.height * 0.1,
                                      width: size.width * 0.25,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(
                                            color: Colors.white,
                                          )),
                                      child: Image.network(
                                        "https://images.unsplash.com/photo-1502740479091-635887520276?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80"
                                        // base +
                                        //'${_homePageController.getcatagartlist!.result![index].imageName.toString()}'
                                        ,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          //if image not comming in catagary then we have to purchase

                                          return Icon(
                                            Icons.error,
                                            color: Colors.grey,
                                          );
                                        },

                                        height: size.height * 0.056,
                                        width: size.width * 0.15,
                                        // color: _homePageController
                                        //             .selectedIndex
                                        //             .value ==
                                        //         index
                                        //     ? Colors.white
                                        //     : MyTheme.ThemeColors
                                      ),
                                    ),
                                    Center(
                                        child: SizedBox(
                                      width: size.width * 0.25,
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
                                            fontSize: 10,
                                            color: Colors.white,

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

                // Padding(
                //   padding: const EdgeInsets.all(5.0),
                //   child: PhysicalModel(
                //     elevation: 2,
                //     color: Colors.white,
                //     shadowColor: Colors.grey,
                //     borderRadius: BorderRadius.circular(10),
                //     child: Padding(
                //       padding: const EdgeInsets.all(5.0),
                //       child: InkWell(
                //         onTap: () {
                //           Get.to(() => ComplaintPage());
                //         },
                //         child: Container(
                //           height: size.height * 0.1,
                //           width: size.width,
                //           decoration: BoxDecoration(
                //             gradient: MyTheme.gradient7,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: Center(
                //               child: Padding(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: size.width * 0.03),
                //             child: Row(
                //               children: [
                //                 Text(
                //                   'Complaint Register',
                //                   style: GoogleFonts.abhayaLibre(
                //                       color: Colors.white,
                //                       fontSize: size.height * 0.03,
                //                       fontWeight: FontWeight.w600),
                //                 ),
                //                 Spacer(),
                //                 IconButton(
                //                     onPressed: () {
                //                       Get.to(() => const RegistrationList());
                //                     },
                //                     icon: Icon(
                //                       Icons.search,
                //                       color: Colors.white,
                //                       size: 30,
                //                     ))
                //               ],
                //             ),
                //           )),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                ///.....
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                //   child: SizedBox(
                //     height: size.height * 0.5,
                //     child: GridView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //           maxCrossAxisExtent: size.height * 0.4,
                //           childAspectRatio: 4 / 3,
                //           crossAxisSpacing: 5,
                //           mainAxisSpacing: 7,
                //           mainAxisExtent: size.height * 0.16,
                //         ),
                //         itemCount: productname.length,
                //         itemBuilder: (BuildContext ctx, index) {
                //           return GestureDetector(
                //             onTap: () {
                //               if (index == 0) {
                //                 Get.to(() => PdfPage());
                //               } else if (index == 1) {
                //                 Get.to(() => AddTechnician());
                //               } else if (index == 2) {
                //                 Get.to(() => Profoile());
                //               } else if (index == 3) {
                //                 // whatsAppOpen();
                //                 // _launchWhatsapp();
                //
                //                 Get.to(() => ComplainList());
                //
                //                 ///Todo this is showing dark and white mode
                //                 ///
                //                 //Get.to(() => TheJwelleryStore());
                //
                //                 //Get.to(() => CarouselDemo());
                //               } else if (index == 4) {
                //                 Get.defaultDialog(
                //                     barrierDismissible: true,
                //                     title: "Welcome to JK Roshini",
                //                     confirm: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: PhysicalModel(
                //                         color: Colors.white,
                //                         shadowColor: Colors.blueGrey,
                //                         elevation: 4,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(3.0),
                //                           child: InkWell(
                //                             onTap: () {
                //                               launch('tel:8396000932');
                //                             },
                //                             child: Container(
                //                                 height: size.height * 0.04,
                //                                 width: size.width * 0.3,
                //                                 color: MyTheme.ThemeColors,
                //                                 child: Center(
                //                                     child: Row(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.center,
                //                                   children: [
                //                                     const Icon(
                //                                       Icons.phone,
                //                                       color: Colors.white,
                //                                     ),
                //                                     SizedBox(
                //                                       width: size.width * 0.03,
                //                                     ),
                //                                     Text(
                //                                       'Call',
                //                                       style: TextStyle(
                //                                         color: MyTheme
                //                                             .bacgroundcolors,
                //                                         fontWeight:
                //                                             FontWeight.bold,
                //                                       ),
                //                                     ),
                //                                   ],
                //                                 ))),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     cancel: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: PhysicalModel(
                //                         color: Colors.white,
                //                         shadowColor: Colors.blueGrey,
                //                         elevation: 4,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(3.0),
                //                           child: InkWell(
                //                             onTap: () {
                //                               _launchWhatsapp();
                //                             },
                //                             child: Container(
                //                                 height: size.height * 0.04,
                //                                 width: size.width * 0.3,
                //                                 color: MyTheme.ThemeColors,
                //                                 child: Center(
                //                                     child: Row(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.center,
                //                                   children: [
                //                                     Icon(
                //                                       Icons.message,
                //                                       color: Colors.white,
                //                                     ),
                //                                     SizedBox(
                //                                       width: size.width * 0.03,
                //                                     ),
                //                                     Text(
                //                                       'Whatsapp',
                //                                       style: TextStyle(
                //                                         color: MyTheme
                //                                             .bacgroundcolors,
                //                                         fontWeight:
                //                                             FontWeight.bold,
                //                                       ),
                //                                     ),
                //                                   ],
                //                                 ))),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                     middleText:
                //                         "We are giving two options to our customer for contact with us.",
                //                     backgroundColor: MyTheme.t1containercolor,
                //                     titleStyle: GoogleFonts.alatsi(
                //                         color: MyTheme.t1Iconcolor,
                //                         fontSize: size.height * 0.03,
                //                         fontWeight: FontWeight.bold),
                //                     middleTextStyle: TextStyle(
                //                         color: MyTheme.containercolor5),
                //                     radius: 10);
                //                 // launch('tel:+1 888888888888');
                //                 //_launchWhatsapp();
                //                 print('okcasll');
                //                 //Get.to(() => AssociatePage());
                //               } else if (index == 5) {
                //                 // Get.defaultDialog(
                //                 //     barrierDismissible: true,
                //                 //     backgroundColor: MyTheme.t1containercolor,
                //                 //     title: '',
                //                 //     content: Column(
                //                 //       mainAxisSize: MainAxisSize.min,
                //                 //       children: [
                //                 //         Directionality(
                //                 //           textDirection: TextDirection.ltr,
                //                 //           child: Center(
                //                 //             child: Padding(
                //                 //               padding:
                //                 //                   const EdgeInsets.all(0.0),
                //                 //               child: TextFormField(
                //                 //                 decoration: InputDecoration(
                //                 //                   filled: true,
                //                 //
                //                 //                   fillColor: MyTheme
                //                 //                       .t1bacgroundcolors1,
                //                 //                   hintText:
                //                 //                       'Enter Service Name',
                //                 //                   contentPadding:
                //                 //                       const EdgeInsets.only(
                //                 //                           left: 14.0,
                //                 //                           bottom: 4.0,
                //                 //                           top: 16.0),
                //                 //                   focusedBorder:
                //                 //                       OutlineInputBorder(
                //                 //                     borderSide: new BorderSide(
                //                 //                         color: Colors.green),
                //                 //                     borderRadius:
                //                 //                         new BorderRadius
                //                 //                             .circular(10),
                //                 //                   ),
                //                 //                   enabledBorder:
                //                 //                       UnderlineInputBorder(
                //                 //                     borderSide: new BorderSide(
                //                 //                         color:
                //                 //                             Colors.transparent),
                //                 //                     borderRadius:
                //                 //                         new BorderRadius
                //                 //                             .circular(10.0),
                //                 //                   ),
                //                 //                   //focusedBorder: InputBorder.none,
                //                 //                   //enabledBorder: InputBorder.none,
                //                 //                   // errorBorder: InputBorder.none,
                //                 //                   // border: InputBorder.none,
                //                 //
                //                 //                   border: OutlineInputBorder(
                //                 //                     borderSide: BorderSide(
                //                 //                         color: Colors.red,
                //                 //                         width: 2.0),
                //                 //                     borderRadius:
                //                 //                         BorderRadius.circular(
                //                 //                             10),
                //                 //                   ),
                //                 //                   // labelText: "Password",
                //                 //                   prefixIcon: Padding(
                //                 //                     padding:
                //                 //                         EdgeInsets.symmetric(
                //                 //                             vertical:
                //                 //                                 size.height *
                //                 //                                     0.012,
                //                 //                             horizontal:
                //                 //                                 size.width *
                //                 //                                     0.02),
                //                 //                     child: Image.asset(
                //                 //                       'lib/assets/images/profile.png',
                //                 //                       color:
                //                 //                           MyTheme.t1Iconcolor,
                //                 //                       height: 10,
                //                 //                       width: 10,
                //                 //                     ),
                //                 //                   ),
                //                 //                 ),
                //                 //                 keyboardType: TextInputType
                //                 //                     .visiblePassword,
                //                 //                 //obscureText: true,
                //                 //                 // controller:
                //                 //                 // _registerComplainController.nameController,
                //                 //                 // onSaved: (value) {
                //                 //                 //   _registerComplainController.name = value!;
                //                 //                 // },
                //                 //                 // validator: (value) {
                //                 //                 //   return _registerComplainController
                //                 //                 //       .validateName(value!);
                //                 //                 // },
                //                 //               ),
                //                 //             ),
                //                 //           ),
                //                 //         ),
                //                 //         // TextField(
                //                 //         //   //controller: settingsScreenController.categoryNameController,
                //                 //         //   keyboardType: TextInputType.text,
                //                 //         //   maxLines: 1,
                //                 //         //   decoration: InputDecoration(
                //                 //         //       labelText: 'Service name',
                //                 //         //       hintMaxLines: 1,
                //                 //         //       border: OutlineInputBorder(
                //                 //         //           borderSide: BorderSide(
                //                 //         //               color: Colors.green,
                //                 //         //               width: 4.0))),
                //                 //         // ),
                //                 //         SizedBox(
                //                 //           height: 30.0,
                //                 //         ),
                //                 //         PhysicalModel(
                //                 //           color: Colors.white,
                //                 //           shadowColor: Colors.grey,
                //                 //           elevation: 4,
                //                 //           borderRadius:
                //                 //               BorderRadius.circular(10),
                //                 //           child: Padding(
                //                 //             padding: const EdgeInsets.all(3.0),
                //                 //             child: Container(
                //                 //               height: size.height * 0.04,
                //                 //               width: size.width * 0.4,
                //                 //               decoration: BoxDecoration(
                //                 //                 color: MyTheme.t1Iconcolor,
                //                 //                 borderRadius:
                //                 //                     BorderRadius.circular(10),
                //                 //               ),
                //                 //               child: Center(
                //                 //                 child: Text(
                //                 //                   'ADD SERVICE',
                //                 //                   style: TextStyle(
                //                 //                       color: Colors.white,
                //                 //                       fontSize: 14.0,
                //                 //                       fontWeight:
                //                 //                           FontWeight.w600),
                //                 //                 ),
                //                 //               ),
                //                 //             ),
                //                 //           ),
                //                 //         ),
                //                 //       ],
                //                 //     ),
                //                 //     radius: 10.0);
                //                 ///
                //                 Get.to(() => ServicesPage());
                //               } else if (index == 6) {
                //                 //Get.to(() => MyHolidayPage());
                //               } else if (index == 7) {
                //                 //Get.to(() => TermsMemberPage());
                //               }
                //             },
                //             child: PhysicalModel(
                //               color: Colors.white,
                //               elevation: 2,
                //               shadowColor: Colors.grey,
                //               borderRadius: BorderRadius.circular(10),
                //               child: Padding(
                //                 padding: const EdgeInsets.all(5.0),
                //                 child: Container(
                //                   height:
                //                       MediaQuery.of(context).size.height * 0.7,
                //                   width:
                //                       MediaQuery.of(context).size.width * 0.9,
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(10),
                //                     gradient: SweepGradient(
                //                       startAngle: pi * 0.2,
                //                       endAngle: pi * 1.8,
                //                       colors: [
                //                         Colors.blue.shade300,
                //                         Colors.yellow.shade500,
                //                         Colors.tealAccent,
                //                         Colors.green,
                //                         Colors.blue.shade300,
                //                       ],
                //                       stops: <double>[
                //                         0.0,
                //                         0.25,
                //                         0.5,
                //                         0.75,
                //                         1.0
                //                       ],
                //                       tileMode: TileMode.clamp,
                //                     ),
                //                   ),
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.center,
                //                     children: [
                //                       PhysicalModel(
                //                         elevation: 1,
                //                         color: Colors.white,
                //                         shadowColor: Colors.blueGrey,
                //                         shape: BoxShape.circle,
                //                         //borderRadius: BorderRadius.circular(10),
                //                         child: Container(
                //                           height: size.height * 0.105,
                //                           width: size.width * 0.21,
                //                           decoration: BoxDecoration(
                //                             color: Colors.white,
                //                             shape: BoxShape.circle,
                //                             //borderRadius: BorderRadius.circular(10),
                //                           ),
                //                           child: Padding(
                //                             padding: const EdgeInsets.all(8.0),
                //                             child: Image.asset(
                //                               productimage[index],
                //                               fit: BoxFit.fill,
                //                             ),
                //                           ),
                //                           // Icon(
                //                           //   producticons[index],
                //                           //   size: size.height * 0.036,
                //                           //   color: MyTheme.t1Iconcolor,
                //                           // ),
                //                         ),
                //                       ),
                //                       SizedBox(
                //                         height: size.height * 0.01,
                //                       ),
                //                       Text(
                //                         productname[index],
                //                         style: GoogleFonts.alegreya(
                //                             color: MyTheme.t1Iconcolor,
                //                             fontSize: size.height * 0.015,
                //                             fontWeight: FontWeight.w800),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             // PhysicalModel(
                //             //   color: MyTheme.t1containercolor,
                //             //   shadowColor: Colors.grey.shade200,
                //             //   elevation: 8,
                //             //   shape: BoxShape.rectangle,
                //             //   borderRadius: BorderRadius.circular(10),
                //             //   child: Container(
                //             //     height: 100,
                //             //     alignment: Alignment.center,
                //             //
                //             //     //child: Text(myProducts[index]["name"]),
                //             //     decoration: BoxDecoration(
                //             //         // color: Colors.white,
                //             //
                //             //         color: MyTheme.t1containercolor,
                //             //         borderRadius: BorderRadius.circular(10)),
                //             //     child: Column(
                //             //       mainAxisAlignment: MainAxisAlignment.center,
                //             //       crossAxisAlignment: CrossAxisAlignment.center,
                //             //       children: [
                //             //         PhysicalModel(
                //             //           elevation: 5,
                //             //           color: Colors.white,
                //             //           shadowColor: Colors.blueGrey,
                //             //           borderRadius: BorderRadius.circular(10),
                //             //           child: Container(
                //             //             height: 60,
                //             //             width: 60,
                //             //             decoration: BoxDecoration(
                //             //               color: Colors.white,
                //             //               borderRadius: BorderRadius.circular(10),
                //             //             ),
                //             //             child: Column(
                //             //               mainAxisAlignment:
                //             //                   MainAxisAlignment.center,
                //             //               crossAxisAlignment:
                //             //                   CrossAxisAlignment.center,
                //             //               children: [
                //             //                 Icon(
                //             //                   producticons[index],
                //             //                   size: size.height * 0.036,
                //             //                   color: MyTheme.t1Iconcolor,
                //             //                 ),
                //             //                 Text(
                //             //                   productname[index],
                //             //                   style: TextStyle(
                //             //                       color: MyTheme.t1Iconcolor,
                //             //                       fontSize: size.height * 0.014,
                //             //                       fontWeight: FontWeight.w700),
                //             //                 ),
                //             //               ],
                //             //             ),
                //             //           ),
                //             //         ),
                //             //       ],
                //             //     ),
                //             //   ),
                //             // ),
                //           );
                //         }),
                //   ),
                // ),
                ///......
                // SizedBox(
                //   height: 2,
                // ),
                //
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: size.width*0.01),
                //   child: SizedBox(
                //     height: size.height*0.15,
                //     width: size.width,
                //     child: ListView.builder(
                //       shrinkWrap: true,
                //         physics: NeverScrollableScrollPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         itemCount: productname1.length,
                //         itemBuilder: (BuildContext context, int index) {
                //           return Padding(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: 8, vertical: 0),
                //             child: PhysicalModel(
                //               color: Colors.grey,
                //               shadowColor: Colors.white,
                //               elevation: 7,
                //               shape: BoxShape.rectangle,
                //               borderRadius: BorderRadius.circular(0),
                //               child: InkWell(
                //                 onTap: () {
                //                   if (index == 0) {
                //                     //Get.to(() => ProfilePage());
                //                     //Get.to(() => LoginPage());
                //                     //Get.to(() => WaterTracking());
                //                   } else if (index == 1) {
                //                     //Get.to(() => MyVoucherPage());
                //                   } else if (index == 2) {
                //                     // Get.defaultDialog(
                //                     //     title: "",
                //                     //     //middleText: "",
                //                     //     backgroundColor: Colors.transparent,
                //                     //     // titleStyle:
                //                     //     //     TextStyle(color: Colors.white),
                //                     //     // middleTextStyle:
                //                     //     //     TextStyle(color: Colors.white),
                //                     //     //textConfirm: "Confirm",
                //                     //     //textCancel: "Cancel",
                //                     //     //cancelTextColor: Colors.white,
                //                     //     //confirmTextColor: Colors.white,
                //                     //     //buttonColor: Colors.red,
                //                     //     barrierDismissible: true,
                //                     //     radius: 0,
                //                     //     content: Column(
                //                     //       children: [
                //                     //         Container(
                //                     //           height: size.height*0.05,
                //                     //           width: size.width,
                //                     //           decoration: BoxDecoration(
                //                     //               color: Colors.red,
                //                     //               border: Border.all(
                //                     //                   color:
                //                     //                   MyTheme.ThemeColors,
                //                     //                   width: 3),
                //                     //               image: DecorationImage(
                //                     //                 image: AssetImage(
                //                     //                     'lib/assets/rotate2.jpeg'),
                //                     //                 fit: BoxFit.fill,
                //                     //               )),
                //                     //           child: TextField(
                //                     //             maxLines: 21,
                //                     //             cursorColor:
                //                     //             MyTheme.t1containercolor,
                //                     //             style: TextStyle(
                //                     //                 color: MyTheme.t1containercolor,
                //                     //                 fontSize: 10),
                //                     //             decoration: InputDecoration(
                //                     //               //fillColor: Colors.grey.shade200,
                //                     //               contentPadding:
                //                     //               EdgeInsets.symmetric(
                //                     //                   vertical: 20,
                //                     //                   horizontal: 20),
                //                     //               // border: OutlineInputBorder(
                //                     //               //     borderRadius: BorderRadius.circular(0),
                //                     //               //     borderSide: BorderSide(
                //                     //               //       color: Colors.red,
                //                     //               //       width: 1,
                //                     //               //     )),
                //                     //               hintText: 'Your  Feedback',
                //                     //               hintStyle: TextStyle(
                //                     //                   color: Colors.grey,
                //                     //                   fontSize: 10,
                //                     //                   fontWeight:
                //                     //                   FontWeight.w500),
                //                     //
                //                     //               disabledBorder:
                //                     //               InputBorder.none,
                //                     //               border: InputBorder.none,
                //                     //               filled: true,
                //                     //             ),
                //                     //           ),
                //                     //         ),
                //                     //         InkWell(
                //                     //           onTap: () {
                //                     //             Get.back();
                //                     //           },
                //                     //           child: Container(
                //                     //               height: size.height*0.04,
                //                     //               width: size.width,
                //                     //               decoration: BoxDecoration(
                //                     //                 color: MyTheme.t1containercolor,
                //                     //               ),
                //                     //               child: Center(
                //                     //                   child: Text(
                //                     //                     "Send",
                //                     //                     style: TextStyle(
                //                     //                       color: Colors.white,
                //                     //                     ),
                //                     //                   ))),
                //                     //         ),
                //                     //       ],
                //                     //     ));
                //                     //Get.to(() => HotDeals());
                //                     //Get.to(() => WalkTracking());
                //                   } else if (index == 3) {
                //                     // FlutterPhoneDirectCaller.callNumber(
                //                     //     '+911140193528');
                //                     //launch('tel:7019380053');
                //                     // _launchURLBrowser();
                //                     //launch('tel:+91 7019380052');
                //                     print('call');
                //
                //                     ///Todo this is showing dark and white mode
                //                     ///
                //                     //Get.to(() => TheJwelleryStore());
                //
                //                     //Get.to(() => CarouselDemo());
                //                   }
                //                 },
                //                 child: Container(
                //                   height: size.height*0.12,
                //                   width: size.width*0.2,
                //                   color: Colors.white70,
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.center,
                //                     children: [
                //                       Icon(
                //                         product1icons[index],
                //                         color: MyTheme.t1containercolor,
                //                         size: 26,
                //                       ),
                //                       SizedBox(
                //                         height: 20,
                //                       ),
                //                       Text(
                //                         productname1[index],
                //                         style: TextStyle(
                //                             color: Colors.grey.shade600,
                //                             fontSize: 9,
                //                             fontWeight: FontWeight.w500),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           );
                //         }),
                //   ),
                // ),
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

  ///....................................................................
  final List<String> images = [
    "https://images.unsplash.com/photo-1588321421727-f807ae7da8a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2067&q=80",
    "https://images.unsplash.com/photo-1590125234767-5aecaa98c228?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1570244921736-115b00e074f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEwfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1581004705471-d5177239ab1f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=600&q=60",
    // "https://images.unsplash.com/photo-1513366884929-f0b3bedfb653?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    //"https://images.unsplash.com/photo-1577801622187-9a1076d049da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFjJTIwcmVwYWlyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    //"https://images.unsplash.com/photo-1615870123253-f3de8aa89e24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXxjVlFHYWlJSTI3OHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  ];

  ///...............................................................
  final bool _isPlaying = true;

  //get _sliderKey => null;

  @override
  Widget build(BuildContext context) {
    var base = 'https://api.gyros.farm/Images/';
    //....
    Size size = MediaQuery.of(context).size;
    //........
    return Scaffold(
      body: Obx(
        () => (_homePageController.isLoading.isFalse)
            ? Center(child: CircularProgressIndicator())
            // : _homePageController.getsliderbaner?.result == null
            //     ? Center(
            //         child: Text('No data'),
            //       )
            : SizedBox(
                height: size.height * 0.25,
                child: Container(
                  height: size.height * 0.25,
                  child: CarouselSlider.builder(
                    key: _sliderKey,
                    unlimitedMode: true,
                    autoSliderTransitionTime: Duration(seconds: 1),
                    slideBuilder: (index) {
                      return Container(
                        height: 260,
                        alignment: Alignment.center,
                        child: Container(
                          height: size.height * 0.38,
                          width: size.width,
                          child: Image.network(
                            //images
                            '${images[index]}',
                            //'${_homePageController.getsliderbaner!.result?[index].image}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              //if image not comming in catagary then we have to purchase
                              return Text(
                                'No Image',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    slideTransform: DefaultTransform(),
                    slideIndicator: CircularSlideIndicator(
                      indicatorBorderWidth: 2,
                      indicatorRadius: 4,
                      itemSpacing: 15,
                      currentIndicatorColor: Colors.red,
                      //MyTheme.t1Iconcolor,
                      padding: EdgeInsets.only(bottom: 3),
                    ),
                    itemCount: images.length,
                    //_homePageController.getsliderbaner!.result!.length,
                    enableAutoSlider: true,
                  ),
                ),
              ),
      ),
    );
  }
}
