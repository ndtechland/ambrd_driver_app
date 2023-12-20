import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_driver_app/controllers/driver_payment_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverPaymentHistory extends StatelessWidget {
  DriverPaymentHistory({Key? key}) : super(key: key);

  // DriverpaymentController _driverpaymentController =
  // Get.put(DriverpaymentController());
  DriverPaymentHistoryController _driverPaymentHistoryController =
      Get.put(DriverPaymentHistoryController());

  ///.............

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ambapp3,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Obx(
            () => _driverPaymentHistoryController.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: size.height * 0.01,
                        right: size.width * 0.01,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: size.height * 0.1,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'lib/assets/transaction-history (1).png',
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03,
                                vertical: size.height * 0.01),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    size: size.height * 0.026,
                                    color: MyTheme.ambapp1,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  'Driver\'s Payment History',
                                  style: GoogleFonts.alatsi(
                                      fontSize: size.height * 0.032,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff023382)),
                                ),
                              ],
                            ),
                          ),
                          //Spacer(),
                          Container(
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(30.0)),
                                color: MyTheme.ambapp10),
                            width: size.width * 0.9,
                            height: size.height * 0.06,
                            margin: new EdgeInsets.fromLTRB(20, 20, 20, 20),
                            padding: new EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(splashColor: Colors.transparent),
                              child: TextField(
                                onChanged: (value) =>
                                    _driverPaymentHistoryController
                                        .filterdriverpaymenthistory(value),
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 15.0, color: MyTheme.ambapp),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  filled: true,
                                  fillColor: MyTheme.ambapp7,
                                  hintText: 'Search name',
                                  contentPadding: const EdgeInsets.only(
                                      left: 10.0, bottom: 12.0, top: 6.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: MyTheme.ambapp7),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () =>
                                //....
                                _driverPaymentHistoryController
                                        .foundpaymenthistorydriver.value.isEmpty
                                    ? Center(
                                        child: Text('No List'),
                                      )
                                    : Expanded(
                                        child: SizedBox(
                                            //height: size.height * 0.76,
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount:
                                                    //4,
                                                    _driverPaymentHistoryController
                                                        .foundpaymenthistorydriver
                                                        .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final item =
                                                      _driverPaymentHistoryController
                                                          .foundpaymenthistorydriver;

                                                  ///....
                                                  //var now = item[index].joiningDate;
                                                  // var formatter =
                                                  // DateFormat('dd-MM-yyyy');
                                                  // String date =
                                                  //formatter.format(now!);
                                                  return Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    size.width *
                                                                        0.03,
                                                                vertical:
                                                                    size.height *
                                                                        0.0005),
                                                        child: Container(
                                                          height: size.height *
                                                              0.25,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      30 / 5),
                                                          decoration:
                                                              BoxDecoration(
                                                            // image: DecorationImage(
                                                            //     image: NetworkImage(
                                                            //         'https://images.unsplash.com/photo-1633526544365-a98d534c9201?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'),
                                                            //     fit: BoxFit.fill),
                                                            //color: MyTheme.containercolor8,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset: Offset(
                                                                    -0, -0),
                                                                spreadRadius: 0,
                                                                blurRadius: 0,
                                                                color: Colors
                                                                    .yellow
                                                                    .shade300,
                                                              ),
                                                              BoxShadow(
                                                                offset: Offset(
                                                                    3, 3),
                                                                spreadRadius: 0,
                                                                blurRadius: 0,
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
                                                              ),
                                                            ],
                                                          ),
                                                          child: Stack(
                                                            //clipBehavior: Clip.none,
                                                            children: [
                                                              Positioned(
                                                                top: -70,
                                                                right: 260,
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      size.height *
                                                                          0.2,
                                                                  width:
                                                                      size.width *
                                                                          0.4,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    //color: Colors.blueGrey,
                                                                    gradient:
                                                                        MyTheme
                                                                            .sweepGradient1,
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                bottom: -120,
                                                                left: 200,
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      size.height *
                                                                          0.32,
                                                                  width:
                                                                      size.width *
                                                                          0.62,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    gradient:
                                                                        MyTheme
                                                                            .gradient9,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Patient Name:',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Paid Amount:',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            //color: MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Payment Id:',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            //color: MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Date:',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            //color: MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Location:',
                                                                          style:
                                                                              GoogleFonts.poppins(
                                                                            //color: MyTheme.text1,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                size.width * 0.035,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          // 'ookokokok',
                                                                          '${item?[index].patientName}',
                                                                          style: GoogleFonts.raleway(
                                                                              color: MyTheme.ambapp,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        Text(
                                                                          '₹${item?[index].totalPrice}',

                                                                          // '₹ '
                                                                          //'10',
                                                                          // '${item?[index].amount}',
                                                                          style: GoogleFonts.raleway(
                                                                              color: MyTheme.ambapp,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        Text(
                                                                          //'qwrdewfew',
                                                                          '${item?[index].paymentId}',
                                                                          style: GoogleFonts.raleway(
                                                                              color: MyTheme.ambapp,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        Text(
                                                                          //'ewewrewrewr',
                                                                          "${_driverPaymentHistoryController?.foundpaymenthistorydriver?[index].paymentDate ?? "00 / 00 / 0000"}",
                                                                          style: GoogleFonts.raleway(
                                                                              color: MyTheme.ambapp,
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: size.width * 0.035),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              size.width * 0.6,
                                                                          height:
                                                                              size.height * 0.03,
                                                                          child:
                                                                              Text(
                                                                            ///'wqdDWwqdw',
                                                                            _driverPaymentHistoryController?.foundpaymenthistorydriver?[index].location ??
                                                                                "no data",
                                                                            style: GoogleFonts.raleway(
                                                                                color: MyTheme.ambapp,
                                                                                fontWeight: FontWeight.w700,
                                                                                fontSize: size.width * 0.031),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                })),
                                      ),
                          ),
                        ],
                      ),
                    ],
                  ),
            // ),
          ),
        ),
      ),
    );
  }
}
