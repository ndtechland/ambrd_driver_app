import 'package:ambrd_driver_app/controllers/booking_request_list_controller.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_driver_app/views/botttom_navigation_bar/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constantsss/app_theme/app_color.dart';

class BookingListUser extends StatelessWidget {
  BookingListUser({Key? key}) : super(key: key);

  DriverRequestListController _driverRequestListController =
      Get.put(DriverRequestListController());

  //DriverPayoutController _driverPayoutController =
  // Get.put(DriverPayoutController());
  ///
  // DriverPayoutHistoryController _driverPayoutHistoryController =
  // Get.put(DriverPayoutHistoryController());

  // DriverRequestListController _driverRequestListController = Get.put(DriverRequestListController());

  NavController _navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ambapp6,
      height: size.height,
      width: size.width,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          //   resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: Container(
                height: size.height * 0.020,
                width: size.width * 0.05,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    _navController.tabindex(0);
                    Get.to(BottomNavBar());
                  },
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: size.height * 0.025,
                  ),
                )),
            elevation: 0,
            backgroundColor: MyTheme.ambapp,
            title: Text(
              'See Your Booking request',
              style: TextStyle(
                color: MyTheme.ambapp3,
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: SafeArea(
            child: Obx(
              () => _driverRequestListController.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          elevation: 1,
                          child: Container(
                            height: size.height * 0.11,
                            decoration: BoxDecoration(
                              color: MyTheme.ambapp,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: size.height * 0.06,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0)),
                                      color: Colors.white),
                                  width: size.width,
                                  // height: size.height * 0.06,
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 15, 10),
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 6, 8, 8),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                        splashColor: Colors.transparent),
                                    child: TextField(
                                      onChanged: (value) =>
                                          _driverRequestListController
                                              .filterdriverbookinglist(value),
                                      autofocus: false,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: MyTheme.ambapp2),
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.search),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Search name',
                                        contentPadding: const EdgeInsets.only(
                                            left: 10.0, bottom: 1.0, top: 0.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                      ),
                                      // onChanged: (value) =>
                                      //     _doctorHomepageController
                                      //         .filterdrApointmentProducts2(
                                      //         value),
                                      // onChanged: (value) =>
                                      //     doctorHomepageController
                                      //         .filterProducts(value),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // _doctorHomepageController
                        //     .founddoctoraptProducts2.value.isEmpty
                        //?
                        // const Center(
                        //       child: Text("No Result Found"))
                        //       :
                        Obx(
                          () =>
                              _driverRequestListController
                                      .founddriverrequestlistdriver
                                      .value
                                      .isEmpty
                                  ? Center(
                                      child: Text('No List'),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              _driverRequestListController
                                                  .founddriverrequestlistdriver
                                                  .length,
                                          // _doctorHomepageController
                                          //     .founddoctoraptProducts2.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final item =
                                                _driverRequestListController
                                                    .founddriverrequestlistdriver;
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: size.height * 0.005,
                                                  horizontal:
                                                      size.width * 0.01),
                                              child: Material(
                                                elevation: 5,
                                                child: Container(
                                                  height: size.height * 0.20,
                                                  decoration: BoxDecoration(
                                                    color: MyTheme.ambapp6,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        0.02),
                                                        child: Material(
                                                          elevation: 9,
                                                          child: Container(
                                                            width: size.width *
                                                                0.27,
                                                            height:
                                                                size.height *
                                                                    0.16,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .grey,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .cyanAccent,
                                                                        width:
                                                                            1.3),
                                                                    image:
                                                                        const DecorationImage(
                                                                      image: NetworkImage(
                                                                          'https://images.unsplash.com/photo-1634025130850-1d24389e25c7?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                                                                          // 'https://images.unsplash.com/photo-1599493758267-c6c884c7071f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80'
                                                                          ),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    )),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.45,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              '${item?[index].patientName}',
                                                              //"ramm ji",
                                                              // "${_doctorHomepageController.founddoctoraptProducts2?[index].patientName}",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    size.height *
                                                                        0.02,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                color: MyTheme
                                                                    .ambapp2,
                                                              ),
                                                            ),
                                                            Text(
                                                              '₹${item?[index].totalPrice}',

                                                              //"11:50",

                                                              //  "${_doctorHomepageController.founddoctoraptProducts2?[index].slotTime}",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    size.height *
                                                                        0.017,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                color: Colors
                                                                    .red
                                                                    .shade300,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.03,
                                                              width:
                                                                  size.width *
                                                                      0.45,
                                                              child: Center(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .place,
                                                                      color: Colors
                                                                          .green,
                                                                      size: size
                                                                              .height *
                                                                          0.022,
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.4,
                                                                      child:
                                                                          Text(
                                                                        '${item?[index].reverseEndLatLongToLocation}',

                                                                        // "New Ashok Nagar",

                                                                        //"${_doctorHomepageController.founddoctoraptProducts2?[index].location}",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              size.height * 0.014,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade600,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            //Spacer(),
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.3,
                                                              child: Text(
                                                                'Passengers:${item?[index].noOfPassengers}',

                                                                //"12/01/2031",
                                                                //"${_doctorHomepageController.founddoctoraptProducts2?[index].appointmentdate}",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      size.height *
                                                                          0.015,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.20,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          size.width *
                                                                              0.006),
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  Get.dialog(
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 40),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(20),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(20.0),
                                                                              child: Material(
                                                                                child: Column(
                                                                                  children: [
                                                                                    const SizedBox(height: 10),
                                                                                    Text(
                                                                                      "You Want to give an offer your price ?",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                        fontSize: 16,
                                                                                        color: Colors.cyan.shade700,
                                                                                        fontWeight: FontWeight.w800,
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(height: 15),
                                                                                    const Text(
                                                                                      "Give a offer price",
                                                                                      textAlign: TextAlign.center,
                                                                                    ),

                                                                                    const SizedBox(height: 20),
                                                                                    //Buttons
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: ElevatedButton(
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              minimumSize: const Size(0, 45),
                                                                                              primary: Colors.red,
                                                                                              onPrimary: const Color(0xFFFFFFFF),
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              // Get.back();
                                                                                            },
                                                                                            child: const Text(
                                                                                              '-10',
                                                                                              style: TextStyle(
                                                                                                fontSize: 20,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                            child: SizedBox(
                                                                                          width: size.width * 0.1,
                                                                                          child: Center(
                                                                                            child: Text(
                                                                                              '₹ 100',
                                                                                              style: TextStyle(
                                                                                                fontSize: size.height * 0.03,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        )),

                                                                                        ///todo:...todo...........................
                                                                                        // const SizedBox(
                                                                                        //     width:
                                                                                        //         10),
                                                                                        Expanded(
                                                                                          child: ElevatedButton(
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              minimumSize: const Size(0, 45),
                                                                                              primary: Colors.green.shade800,
                                                                                              onPrimary: const Color(0xFFFFFFFF),
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              // await _callNumber(
                                                                                              //     "${_doctorHomepageController.founddoctoraptProducts2?[index].mobileNumber}".toString());
                                                                                              //Get.back();
                                                                                            },
                                                                                            child: const Text(
                                                                                              '+10',
                                                                                              style: TextStyle(
                                                                                                fontSize: 20,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    const SizedBox(height: 20),

                                                                                    ElevatedButton(
                                                                                      style: ElevatedButton.styleFrom(
                                                                                        minimumSize: const Size(0, 45),
                                                                                        primary: Colors.indigo,
                                                                                        onPrimary: const Color(0xFFFFFFFF),
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                        ),
                                                                                      ),
                                                                                      onPressed: () {
                                                                                        Get.back();
                                                                                      },
                                                                                      child: const Text(
                                                                                        'Send',
                                                                                        style: TextStyle(
                                                                                          fontSize: 20,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .black38),

                                                                  shadowColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .black),

                                                                  elevation:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              12),

                                                                  minimumSize:
                                                                      MaterialStateProperty.all(
                                                                          const Size(
                                                                              50,
                                                                              30)),

                                                                  // fixedSize:
                                                                  //     MaterialStateProperty
                                                                  //         .all(
                                                                  //             const Size(
                                                                  //                 70,
                                                                  //                 20)),
                                                                  shape:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  'Offer Price',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          size.width *
                                                                              0.01),
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  Get.dialog(
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 40),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(20),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(20.0),
                                                                              child: Material(
                                                                                child: Column(
                                                                                  children: [
                                                                                    const SizedBox(height: 10),
                                                                                    Text(
                                                                                      "You Want to Reject booking ?",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                        fontSize: 16,
                                                                                        color: Colors.cyan.shade700,
                                                                                        fontWeight: FontWeight.w800,
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(height: 15),
                                                                                    const Text(
                                                                                      "You want to Reject this booking",
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    const SizedBox(height: 20),
                                                                                    //Buttons
                                                                                    Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: ElevatedButton(
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              minimumSize: const Size(0, 45),
                                                                                              primary: Colors.red,
                                                                                              onPrimary: const Color(0xFFFFFFFF),
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              Get.back();
                                                                                            },
                                                                                            child: const Text(
                                                                                              'NO',
                                                                                              style: TextStyle(
                                                                                                fontSize: 20,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(width: 10),
                                                                                        Expanded(
                                                                                          child: ElevatedButton(
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              minimumSize: const Size(0, 45),
                                                                                              primary: Colors.green.shade800,
                                                                                              onPrimary: const Color(0xFFFFFFFF),
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              // await _callNumber(
                                                                                              //     "${_doctorHomepageController.founddoctoraptProducts2?[index].mobileNumber}".toString());
                                                                                              Get.back();
                                                                                            },
                                                                                            child: const Text(
                                                                                              'Yes',
                                                                                              style: TextStyle(
                                                                                                fontSize: 20,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                  SharedPreferences
                                                                      prefs =
                                                                      await SharedPreferences
                                                                          .getInstance();
                                                                  prefs
                                                                      .setString(
                                                                    "DrIds",
                                                                    ""
                                                                    // "${_doctorHomepageController.founddoctoraptProducts2?[index].id}"
                                                                    // .toString()
                                                                    ,

                                                                    // "${_nurseHistoryController.foundNurse[index].id.toString()}"
                                                                  );
                                                                },
                                                                child: Text(
                                                                  'Reject',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                  ),
                                                                ),
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .red),

                                                                  shadowColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .red),

                                                                  elevation:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              12),

                                                                  minimumSize:
                                                                      MaterialStateProperty.all(
                                                                          const Size(
                                                                              50,
                                                                              30)),

                                                                  // fixedSize:
                                                                  //     MaterialStateProperty
                                                                  //         .all(
                                                                  //             const Size(
                                                                  //                 70,
                                                                  //                 20)),
                                                                  shape:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          size.width *
                                                                              0.01),
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  Get.dialog(
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 40),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(20),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(20.0),
                                                                              child: Material(
                                                                                child: Column(
                                                                                  children: [
                                                                                    const SizedBox(height: 10),
                                                                                    Text(
                                                                                      "You Want to accept booking ?",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(
                                                                                        fontSize: 16,
                                                                                        color: Colors.cyan.shade700,
                                                                                        fontWeight: FontWeight.w800,
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(height: 15),
                                                                                    const Text(
                                                                                      "You want to accept this booking",
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    const SizedBox(height: 20),
                                                                                    //Buttons
                                                                                    Row(
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: ElevatedButton(
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              minimumSize: const Size(0, 45),
                                                                                              primary: Colors.red,
                                                                                              onPrimary: const Color(0xFFFFFFFF),
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              Get.back();
                                                                                            },
                                                                                            child: const Text(
                                                                                              'NO',
                                                                                              style: TextStyle(
                                                                                                fontSize: 20,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        const SizedBox(width: 10),
                                                                                        Expanded(
                                                                                          child: ElevatedButton(
                                                                                            style: ElevatedButton.styleFrom(
                                                                                              minimumSize: const Size(0, 45),
                                                                                              primary: Colors.green.shade800,
                                                                                              onPrimary: const Color(0xFFFFFFFF),
                                                                                              shape: RoundedRectangleBorder(
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                              ),
                                                                                            ),
                                                                                            onPressed: () async {
                                                                                              // await _callNumber(
                                                                                              //     "${_doctorHomepageController.founddoctoraptProducts2?[index].mobileNumber}".toString());
                                                                                              Get.back();
                                                                                            },
                                                                                            child: const Text(
                                                                                              'Yes',
                                                                                              style: TextStyle(
                                                                                                fontSize: 20,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                  // print(
                                                                  //     "mobilee:${_doctorHomepageController.founddoctoraptProducts2?[index].mobileNumber}");

                                                                  //   Get.to(
                                                                  //       UserVideoAudio());
                                                                },
                                                                style:
                                                                    ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .green),

                                                                  shadowColor:
                                                                      MaterialStateProperty.all(
                                                                          Colors
                                                                              .green),

                                                                  elevation:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              12),

                                                                  minimumSize:
                                                                      MaterialStateProperty.all(
                                                                          const Size(
                                                                              50,
                                                                              30)),

                                                                  // fixedSize:
                                                                  //     MaterialStateProperty
                                                                  //         .all(
                                                                  //             const Size(
                                                                  //                 70,
                                                                  //                 20)),
                                                                  shape:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  'Accept',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            // const Icon(
                                                            //     Icons.calendar_today),

                                                            //Spacer(),
                                                            // Text(
                                                            //   '12 am',
                                                            //   style: TextStyle(
                                                            //     fontSize:
                                                            //         size.height *
                                                            //             0.017,
                                                            //     fontWeight:
                                                            //         FontWeight.w600,
                                                            //     color: Colors.green,
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                        )
                      ],
                    ),
            ),
          )),
    );
  }
}
