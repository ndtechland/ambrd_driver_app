import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constantsss/app_theme/app_color.dart';
import '../botttom_navigation_bar/bottom_nav_bar_controller.dart';

class tracking_users extends StatefulWidget {
  tracking_users({Key? key}) : super(key: key);

  @override
  State<tracking_users> createState() => _tracking_usersState();
}

bool _isAcceptTermsAndConditions = false;

NavController _navcontroller = Get.put(NavController(), permanent: true);

class _tracking_usersState extends State<tracking_users> {
  ///.....
  String location = 'Null, Press Button';
  String Address = 'search';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  ///.....
  String googleApikey = "AIzaSyBrbWFXlOYpaq51wteSyFS2UjdMPOWBlQw";
  GoogleMapController? mapController;
  GoogleMapController? mapController2; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(28.535517, 77.391029);
  // String location = "Search Start Location";
  String location2 = "Search End Location";
  // tilecolorxController _tilecontroller = Get.put(tilecolorxController());

  ///............................ewrw
  late LatLng _center;
  late Position currentLocation;

  late LatLng currentPostion;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print('center $_center');
  }

  ///........
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(25.5941, 85.1376),
        // flat: 14.4746,

        infoWindow: InfoWindow(
          title: 'User Position',
        )),
  ];

  //var index;

  //get index => null;

  ///.............................
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  ///todo:........................

  // tilecolorx _tilecolorr = Get.put(tilecolorx());

  //MapViewController _controller = Get.put(MapViewController());

  NavController _navController = Get.put(NavController());

  final List<String> productname = [
    'Invoice',
    'Add Technician',
    'Profile',
    'Complaint List',
    'Customer Support',
    'Add Services',
  ];

  final List<String> _itemsss = ['First', 'Second', 'Third', 'Fourth', 'Fifth'];

  final List<String> _itemsssimage = [
    'lib/assets/images/AMB1.png',
    'lib/assets/images/AMB4.png',
    'lib/assets/images/AMB3.png',
    'lib/assets/images/AMB4.png',
    'lib/assets/images/AMB3.png'
  ];

  ///.........

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    //tilecolorx tcx = get.put(tilecolorx());

    bool shouldPop = false;

    return Scaffold(
      backgroundColor: MyTheme.ambapp3,
      body:
          // GoogleMap(
          //   mapType: MapType.hybrid,
          //   initialCameraPosition: _kGooglePlex,
          //   onMapCreated: (GoogleMapController controller) {
          //     _controller.complete(controller);
          //   },
          // ),
          ///

          SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.53,
              child: GoogleMap(
                markers: Set<Marker>.of(_markers),
                //Map widget from google_maps_flutter package
                ///........................
                zoomGesturesEnabled: true,

                ///...............................
                ///enable Zoom in, out on map
                initialCameraPosition: CameraPosition(
                  //innital position in map
                  target: startLocation, //initial position
                  zoom: 14.0, //initial zoom level
                ),

                ///todo:......................................................................
                mapType: MapType.normal,
                myLocationEnabled: true,
                compassEnabled: true,
                onMapCreated: (controller) {
                  //method called when map is created
                  setState(() async {
                    await CameraPosition(target: startLocation);
                    mapController = controller;
                    mapController2 = controller;
                  });
                },
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    height: size.height * 0.37,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    // width: size.width,
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: size.height * 0.11,
                        //   child: ListView.builder(
                        //     itemCount: _itemsss.length,
                        //     scrollDirection: Axis.horizontal,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return InkWell(
                        //         onTap: () {
                        //           //..............................
                        //           _tilecolorr.toggle(index);
                        //
                        //           ///...............................
                        //
                        //           //................................
                        //         },
                        //         child: Obx(
                        //           () => Padding(
                        //             padding: EdgeInsets.all(8.0),
                        //             child: PhysicalModel(
                        //               //color: Colors.white,
                        //               shadowColor: Colors.red,
                        //               color: Colors.black,
                        //               borderRadius: BorderRadius.circular(10),
                        //
                        //               elevation: 5,
                        //               child: Container(
                        //                 height: size.height * 0.04,
                        //                 width: size.width * 0.19,
                        //                 decoration: BoxDecoration(
                        //                     color:
                        //                         _tilecolorr.selectedindex.value ==
                        //                                 index
                        //                             ? MyTheme.ambapp5
                        //                             : MyTheme.ambapp1,
                        //                     borderRadius:
                        //                         BorderRadius.circular(10),
                        //                     border: Border.all(
                        //                         color: _tilecolorr.selectedindex
                        //                                     .value ==
                        //                                 index
                        //                             ? MyTheme.ThemeColors
                        //                             : MyTheme.ambapp1,
                        //                         width: 1)),
                        //
                        //                 child: Column(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.spaceBetween,
                        //                   children: [
                        //                     Container(
                        //                       height: size.height * 0.065,
                        //                       decoration: BoxDecoration(
                        //                           color: _tilecolorr.selectedindex
                        //                                       .value ==
                        //                                   index
                        //                               ? MyTheme.ambapp1
                        //                               : MyTheme.ambapp11,
                        //                           borderRadius:
                        //                               BorderRadius.circular(10),
                        //                           image: DecorationImage(
                        //                             image: AssetImage(
                        //                                 _itemsssimage[index]),
                        //                           )),
                        //                     ),
                        //                     Spacer(),
                        //                     Text('${_itemsss[index]}',
                        //                         style: TextStyle(
                        //                             color: _tilecolorr
                        //                                         .selectedindex
                        //                                         .value ==
                        //                                     index
                        //                                 ? Colors.white
                        //                                 : Colors.black,
                        //                             fontSize: size.height * 0.015,
                        //                             fontWeight: FontWeight.w600)),
                        //                     Spacer(),
                        //                   ],
                        //                 ),
                        //                 // ListTile(
                        //                 //   title: Obx(() => Text('${_itemsss[index]} item',
                        //                 //       style: TextStyle(
                        //                 //           color: _tilecolorr.selectedindex.value == index
                        //                 //               ? Colors.white
                        //                 //               : Colors.black))),
                        //                 //   onTap: () => _tilecolorr.toggle(index),
                        //                 // ),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //     // itemBuilder: (BuildContext context, int index) {
                        //     //
                        //     // },
                        //   ),
                        // ),
                        //SizedBox(height: height * 0.06),...................................
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: size.height * 0.045,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: MyTheme.ambapp,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Icon(
                                    Icons.pin_drop_rounded,
                                    color: MyTheme.ambapp1,
                                  ),
                                ),
                                Text(
                                  'Start Point',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: MyTheme.ambapp3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // TextFormField(
                          //   //controller: _loginMobileController.MobileOrEmail,
                          //   //controller.emailController,
                          //   obscureText: false,
                          //   keyboardType: TextInputType.number,
                          //   // validator: (value) {
                          //   //   return _loginMobileController
                          //   //       .validatePhone(value!);
                          //   // },
                          //   decoration: InputDecoration(
                          //     //border: InputBorder.none,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(15.0),
                          //       borderSide:
                          //           BorderSide(color: Colors.red, width: 1),
                          //     ),
                          //     contentPadding: const EdgeInsets.only(
                          //         left: 14.0, bottom: 8.0, top: 13.0),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.red,
                          //       ),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.transparent),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //
                          //     prefixIcon: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Icon(
                          //         Icons.currency_rupee,
                          //         color: MyTheme.ambapp1,
                          //       ),
                          //       // Image.asset(
                          //       //   "lib/assets/images/pnone4.png",
                          //       //   color: MyTheme.ambapp1,
                          //       //   height: 10,
                          //       //   width: 10,
                          //       // ),
                          //     ),
                          //     fillColor: MyTheme.ambapp12,
                          //     filled: true,
                          //     suffixIcon: null ?? const SizedBox(),
                          //     hintText: "Offer Your Fare",
                          //     hintStyle: GoogleFonts.poppins(
                          //       fontSize: 14.0,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //     // contentPadding:
                          //     //const EdgeInsets.only(top: 16.0),
                          //   ),
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: size.height * 0.045,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: MyTheme.ambapp,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Icon(
                                    Icons.pin_drop_rounded,
                                    color: MyTheme.ambapp1,
                                  ),
                                ),
                                Text(
                                  'End Point',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: MyTheme.ambapp3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // TextFormField(
                          //   //controller: _loginMobileController.MobileOrEmail,
                          //   //controller.emailController,
                          //   obscureText: false,
                          //   keyboardType: TextInputType.number,
                          //   // validator: (value) {
                          //   //   return _loginMobileController
                          //   //       .validatePhone(value!);
                          //   // },
                          //   decoration: InputDecoration(
                          //     //border: InputBorder.none,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(15.0),
                          //       borderSide:
                          //           BorderSide(color: Colors.red, width: 1),
                          //     ),
                          //     contentPadding: const EdgeInsets.only(
                          //         left: 14.0, bottom: 8.0, top: 13.0),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.red,
                          //       ),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.transparent),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //
                          //     prefixIcon: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Icon(
                          //         Icons.currency_rupee,
                          //         color: MyTheme.ambapp1,
                          //       ),
                          //       // Image.asset(
                          //       //   "lib/assets/images/pnone4.png",
                          //       //   color: MyTheme.ambapp1,
                          //       //   height: 10,
                          //       //   width: 10,
                          //       // ),
                          //     ),
                          //     fillColor: MyTheme.ambapp12,
                          //     filled: true,
                          //     suffixIcon: null ?? const SizedBox(),
                          //     hintText: "Offer Your Fare",
                          //     hintStyle: GoogleFonts.poppins(
                          //       fontSize: 14.0,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //     // contentPadding:
                          //     //const EdgeInsets.only(top: 16.0),
                          //   ),
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: size.height * 0.045,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: MyTheme.ambapp,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Icon(
                                    Icons.currency_rupee,
                                    color: MyTheme.ambapp1,
                                  ),
                                ),
                                Text(
                                  'Offer Amounts',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: MyTheme.ambapp3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // TextFormField(
                          //   //controller: _loginMobileController.MobileOrEmail,
                          //   //controller.emailController,
                          //   obscureText: false,
                          //   keyboardType: TextInputType.number,
                          //   // validator: (value) {
                          //   //   return _loginMobileController
                          //   //       .validatePhone(value!);
                          //   // },
                          //   decoration: InputDecoration(
                          //     //border: InputBorder.none,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(15.0),
                          //       borderSide:
                          //           BorderSide(color: Colors.red, width: 1),
                          //     ),
                          //     contentPadding: const EdgeInsets.only(
                          //         left: 14.0, bottom: 8.0, top: 13.0),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.red,
                          //       ),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.transparent),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //
                          //     prefixIcon: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Icon(
                          //         Icons.currency_rupee,
                          //         color: MyTheme.ambapp1,
                          //       ),
                          //       // Image.asset(
                          //       //   "lib/assets/images/pnone4.png",
                          //       //   color: MyTheme.ambapp1,
                          //       //   height: 10,
                          //       //   width: 10,
                          //       // ),
                          //     ),
                          //     fillColor: MyTheme.ambapp12,
                          //     filled: true,
                          //     suffixIcon: null ?? const SizedBox(),
                          //     hintText: "Offer Your Fare",
                          //     hintStyle: GoogleFonts.poppins(
                          //       fontSize: 14.0,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //     // contentPadding:
                          //     //const EdgeInsets.only(top: 16.0),
                          //   ),
                          // ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: size.height * 0.045,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: MyTheme.ambapp,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Icon(
                                    Icons.comment,
                                    color: MyTheme.ambapp1,
                                  ),
                                ),
                                Text(
                                  '4 passenger',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: MyTheme.ambapp3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // TextFormField(
                          //   //controller: _loginMobileController.MobileOrEmail,
                          //   //controller.emailController,
                          //   obscureText: false,
                          //   keyboardType: TextInputType.number,
                          //   // validator: (value) {
                          //   //   return _loginMobileController
                          //   //       .validatePhone(value!);
                          //   // },
                          //   decoration: InputDecoration(
                          //     //border: InputBorder.none,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(15.0),
                          //       borderSide:
                          //           BorderSide(color: Colors.red, width: 1),
                          //     ),
                          //     contentPadding: const EdgeInsets.only(
                          //         left: 14.0, bottom: 8.0, top: 13.0),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.red,
                          //       ),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.transparent),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //
                          //     prefixIcon: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Icon(
                          //         Icons.currency_rupee,
                          //         color: MyTheme.ambapp1,
                          //       ),
                          //       // Image.asset(
                          //       //   "lib/assets/images/pnone4.png",
                          //       //   color: MyTheme.ambapp1,
                          //       //   height: 10,
                          //       //   width: 10,
                          //       // ),
                          //     ),
                          //     fillColor: MyTheme.ambapp12,
                          //     filled: true,
                          //     suffixIcon: null ?? const SizedBox(),
                          //     hintText: "Offer Your Fare",
                          //     hintStyle: GoogleFonts.poppins(
                          //       fontSize: 14.0,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //     // contentPadding:
                          //     //const EdgeInsets.only(top: 16.0),
                          //   ),
                          // ),
                        ),

                        ///

                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: size.height * 0.065,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: MyTheme.ambapp,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: Container(
                                    height: size.height * 0.04,
                                    width: size.width * 0.15,
                                    color: MyTheme.ambapp13,
                                    child: Center(
                                      child: Text(
                                        '- 10',
                                        style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Current Fare',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: MyTheme.ambapp3,
                                      ),
                                    ),
                                    Text(
                                      '₹ 99',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.ambapp3,
                                      ),
                                    ),
                                  ],
                                ),

                                ///..............................................
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.03),
                                  child: InkWell(
                                    onTap: () {
                                      // _isAcceptTermsAndConditions =
                                      // _tilecontroller.selectedindex.value ?? false;
                                    },
                                    child: Container(
                                      height: size.height * 0.04,
                                      width: size.width * 0.16,
                                      color: MyTheme.ambapp5,

                                      // _tilecontroller.selectedindex.value ==
                                      //     _isAcceptTermsAndConditions
                                      //     ? MyTheme.ambapp5
                                      //     : MyTheme.ambapp1,
                                      child: Center(
                                        child: Text(
                                          '+ 10',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // TextFormField(
                          //   //controller: _loginMobileController.MobileOrEmail,
                          //   //controller.emailController,
                          //   obscureText: false,
                          //   keyboardType: TextInputType.number,
                          //   // validator: (value) {
                          //   //   return _loginMobileController
                          //   //       .validatePhone(value!);
                          //   // },
                          //   decoration: InputDecoration(
                          //     //border: InputBorder.none,
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(15.0),
                          //       borderSide:
                          //           BorderSide(color: Colors.red, width: 1),
                          //     ),
                          //     contentPadding: const EdgeInsets.only(
                          //         left: 14.0, bottom: 8.0, top: 13.0),
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.red,
                          //       ),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(color: Colors.transparent),
                          //       borderRadius: BorderRadius.circular(15.7),
                          //     ),
                          //
                          //     prefixIcon: Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Icon(
                          //         Icons.currency_rupee,
                          //         color: MyTheme.ambapp1,
                          //       ),
                          //       // Image.asset(
                          //       //   "lib/assets/images/pnone4.png",
                          //       //   color: MyTheme.ambapp1,
                          //       //   height: 10,
                          //       //   width: 10,
                          //       // ),
                          //     ),
                          //     fillColor: MyTheme.ambapp12,
                          //     filled: true,
                          //     suffixIcon: null ?? const SizedBox(),
                          //     hintText: "Offer Your Fare",
                          //     hintStyle: GoogleFonts.poppins(
                          //       fontSize: 14.0,
                          //       fontWeight: FontWeight.w400,
                          //     ),
                          //     // contentPadding:
                          //     //const EdgeInsets.only(top: 16.0),
                          //   ),
                          // ),
                        ),

                        SizedBox(
                          height: size.height * 0.001,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.15),
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tightFor(width: context.width),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(MyTheme.ambapp1),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(14)),
                              ),
                              child: Text(
                                "Increase Fare",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              onPressed: () {
                                // print(
                                // "RadioButton:${_signUpController.selectedService}");
                                //_signUpController.checkLogin();
                                // Get.to(() => LoginPasswordPage());
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 26),
                child: InkWell(
                    onTap: () {
                      ///...................................
                      _navController.tabindex(0);

                      ///
                      ///
                      // Get.back();

                      ///todo .........................
                      //
                    },
                    child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            // //search autoconplete input
            // Positioned(
            //     //search input bar
            //     top: 20,
            //     child: InkWell(
            //         onTap: () async {
            //           var place = await PlacesAutocomplete.show(
            //               context: context,
            //               apiKey: googleApikey,
            //               mode: Mode.overlay,
            //               types: [],
            //               strictbounds: false,
            //               components: [Component(Component.country, 'Ind')],
            //               //google_map_webservice package
            //               onError: (err) {
            //                 print(err);
            //               });
            //
            //           if (place != null) {
            //             setState(() {
            //               location = place.description.toString();
            //             });
            //
            //             //form google_maps_webservice package
            //             final plist = GoogleMapsPlaces(
            //               apiKey: googleApikey,
            //               apiHeaders: await GoogleApiHeaders().getHeaders(),
            //               //from google_api_headers package
            //             );
            //             String placeid = place.placeId ?? "0";
            //             final detail = await plist.getDetailsByPlaceId(placeid);
            //             final geometry = detail.result.geometry!;
            //             final lat = geometry.location.lat;
            //             final lang = geometry.location.lng;
            //             var newlatlang = LatLng(lat, lang);
            //
            //             //move map camera to selected place with animation
            //             mapController?.animateCamera(
            //                 CameraUpdate.newCameraPosition(
            //                     CameraPosition(target: newlatlang, zoom: 17)));
            //             mapController2?.animateCamera(
            //                 CameraUpdate.newCameraPosition(
            //                     CameraPosition(target: newlatlang, zoom: 17)));
            //           }
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.all(15),
            //           child: Card(
            //             child: Container(
            //                 padding: EdgeInsets.all(0),
            //                 width: MediaQuery.of(context).size.width - 40,
            //                 child: ListTile(
            //                   title: Text(
            //                     location,
            //                     style: TextStyle(fontSize: 18),
            //                   ),
            //                   trailing: Icon(Icons.search),
            //                   dense: true,
            //                 )),
            //           ),
            //         ))),
            //
            // Positioned(
            //     //search input bar
            //     top: 80,
            //     child: InkWell(
            //         onTap: () async {
            //           var place = await PlacesAutocomplete.show(
            //               context: context,
            //               apiKey: googleApikey,
            //               mode: Mode.overlay,
            //               types: [],
            //               strictbounds: false,
            //               components: [Component(Component.country, 'Ind')],
            //               //google_map_webservice package
            //               onError: (err) {
            //                 print(err);
            //               });
            //
            //           if (place != null) {
            //             setState(() {
            //               location = place.description.toString();
            //             });
            //
            //             //form google_maps_webservice package
            //             final plist = GoogleMapsPlaces(
            //               apiKey: googleApikey,
            //               apiHeaders: await GoogleApiHeaders().getHeaders(),
            //               //from google_api_headers package
            //             );
            //             String placeid2 = place.placeId ?? "0";
            //             final detail = await plist.getDetailsByPlaceId(placeid2);
            //             final geometry2 = detail.result.geometry!;
            //             final lat2 = geometry2.location.lat;
            //             final lang2 = geometry2.location.lng;
            //             var newlatlang = LatLng(lat2, lang2);
            //
            //             //move map camera to selected place with animation
            //             mapController2?.animateCamera(
            //                 CameraUpdate.newCameraPosition(
            //                     CameraPosition(target: newlatlang, zoom: 17)));
            //           }
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.all(15),
            //           child: Card(
            //             child: Container(
            //                 padding: EdgeInsets.all(0),
            //                 width: MediaQuery.of(context).size.width - 40,
            //                 child: ListTile(
            //                   title: Text(
            //                     location2,
            //                     style: TextStyle(fontSize: 18),
            //                   ),
            //                   trailing: Icon(Icons.search),
            //                   dense: true,
            //                 )),
            //           ),
            //         ))),
          ],
        ),
      ),

      // Column(
      //   children: [
      //     Spacer(),
      //     SizedBox(
      //       height: size.height * 0.17,
      //       // width: size.width,
      //       child: ListView.builder(
      //         itemCount: _itemsss.length,
      //         scrollDirection: Axis.horizontal,
      //         itemBuilder: (BuildContext context, int index) {
      //           return InkWell(
      //             onTap: () {
      //               _tilecolorr.toggle(index);
      //             },
      //             child: Obx(
      //               () => Padding(
      //                 padding: EdgeInsets.all(8.0),
      //                 child: PhysicalModel(
      //                   //color: Colors.white,
      //                   shadowColor: Colors.red,
      //                   color: Colors.black,
      //                   borderRadius: BorderRadius.circular(10),
      //
      //                   elevation: 80,
      //                   child: Container(
      //                     height: size.height * 0.05,
      //                     width: size.width * 0.295,
      //                     decoration: BoxDecoration(
      //                         color: _tilecolorr.selectedindex.value == index
      //                             ? MyTheme.ambapp5
      //                             : MyTheme.ambapp1,
      //                         borderRadius: BorderRadius.circular(10),
      //                         border: Border.all(
      //                             color:
      //                                 _tilecolorr.selectedindex.value == index
      //                                     ? MyTheme.ThemeColors
      //                                     : MyTheme.ambapp1,
      //                             width: 1)),
      //
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(
      //                           height: size.height * 0.12,
      //                           decoration: BoxDecoration(
      //                               color: _tilecolorr.selectedindex.value ==
      //                                       index
      //                                   ? MyTheme.ambapp1
      //                                   : MyTheme.ambapp11,
      //                               borderRadius: BorderRadius.circular(10),
      //                               image: DecorationImage(
      //                                 image: AssetImage(_itemsssimage[index]),
      //                               )),
      //                         ),
      //                         Spacer(),
      //                         Text('${_itemsss[index]}',
      //                             style: TextStyle(
      //                                 color:
      //                                     _tilecolorr.selectedindex.value ==
      //                                             index
      //                                         ? Colors.white
      //                                         : Colors.black,
      //                                 fontSize: size.height * 0.015,
      //                                 fontWeight: FontWeight.w600)),
      //                         Spacer(),
      //                       ],
      //                     ),
      //                     // ListTile(
      //                     //   title: Obx(() => Text('${_itemsss[index]} item',
      //                     //       style: TextStyle(
      //                     //           color: _tilecolorr.selectedindex.value == index
      //                     //               ? Colors.white
      //                     //               : Colors.black))),
      //                     //   onTap: () => _tilecolorr.toggle(index),
      //                     // ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           );
      //         },
      //         // itemBuilder: (BuildContext context, int index) {
      //         //
      //         // },
      //       ),
      //     ),
      //   ],
      // ),
      ///.....
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     getUserCurrentLocation().then((value) async {
      //       print(value.latitude.toString() + " " + value.longitude.toString());
      //
      //       // marker added for current users location
      //       _markers.add(Marker(
      //         markerId: MarkerId("2"),
      //         position: LatLng(value.latitude, value.longitude),
      //         infoWindow: InfoWindow(
      //           title: 'My Current Location',
      //         ),
      //       ));
      //
      //       // specified current users location
      //       CameraPosition cameraPosition = new CameraPosition(
      //         target: LatLng(value.latitude, value.longitude),
      //         zoom: 14,
      //       );
      //
      //       final GoogleMapController controller = await _controller.future;
      //       controller
      //           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      //       setState(() {});
      //     });
      //   },
      //   child: Icon(Icons.local_activity),
      // ),
      ///......floatingaction......
    );
  }

  ///....
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           getUserCurrentLocation().then((value) async {
//             print(value.latitude.toString() + " " + value.longitude.toString());
//
//             // marker added for current users location
//             _markers.add(Marker(
//               markerId: MarkerId("2"),
//               position: LatLng(value.latitude, value.longitude),
//               infoWindow: InfoWindow(
//                 title: 'My Current Location',
//               ),
//             ));
//
//             // specified current users location
//             CameraPosition cameraPosition = new CameraPosition(
//               target: LatLng(value.latitude, value.longitude),
//               zoom: 14,
//             );
//
//             final GoogleMapController controller = await _controller.future;
//             controller
//                 .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//             setState(() {});
//           });
//         },
//         child: Icon(Icons.local_activity),
//       ),
  ///
}

getMarkers() {
  // Add this line. Create map view controller object
  //final MapViewController _controller = Get.find(); // <======= Add
  //get markers from controller
  // var realdata = mapcontroller.realtimeList;

  // realdata.asMap().forEach((key, value) {
  //   var _marker = Marker(
  //       consumeTapEvents: true,
  //       markerId: MarkerId(key.toString()),
  //       position: LatLng(
  //           double.parse(value.latitude), double.parse(value.longitude)),
  //       onTap: () {
  //         //do something here
  //       });
  //
  //   _controller.allMarkers.add(_marker); // <===== Update
  //   _controller.update() // <=== Add, because you are using GetBuilder
  // });
}
