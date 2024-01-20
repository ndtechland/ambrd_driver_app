import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_driver_app/controllers/home_controllers.dart';
import 'package:ambrd_driver_app/controllers/otp_controller_new_correct/otp_new_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'otp_verify_controller.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key}) : super(key: key);

  // LoginMobileController _loginMobileController = Get.find();

  //LoginMobileController loginMobileController = Get.find();
  OtpVerifyController _otpVerifyController = Get.put(OtpVerifyController());
  bool firstbox = false;
  //get otp => null;

  HomeController _homePageController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height * 0.96,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1619025873875-59dfdd2bbbd6?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        //"https://images.unsplash.com/photo-1595246478312-5a49fbcf31b4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        // "https://images.unsplash.com/photo-1642438114426-bad6b9ce05da?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        //'https://unsplash.com/photos/a-couple-of-people-sitting-next-to-each-other-in-a-room-C53CnEp-hsU'
                        //'https://images.unsplash.com/photo-1587985399301-ec1cfb049c9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                        // 'https://images.unsplash.com/photo-1555516474-f30ac966572f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'
                        // 'https://images.unsplash.com/photo-1543544171-1d597a130cca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                        //'https://images.unsplash.com/photo-1568041002045-27791242a745?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1820&q=80'
                        ),
                    fit: BoxFit.fill)),

            ///color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: size.height * 0.03,
                        height: size.width * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_back_ios_outlined),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'lib/assets/ambrdcommanlogo.jpg',
                  ),
                ),
                Spacer(),
                Text(
                  'OTP VERIFICATION DRIVER',
                  style: GoogleFonts.roboto(
                    backgroundColor: Colors.black,
                    fontSize: size.height * 0.03,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                // Container(
                //   height: 30.h,
                //   child: Lottie.asset(
                //     'lib/assets/asset/4430-phone-number-verification.json',
                //     height: 400.0,
                //
                //     ///repeat: true,
                //     // reverse: true,
                //     //animate: true,
                //   ),
                // ),
                // SizedBox(
                //   height: 60,
                // ),
                Spacer(),
                Container(
                  height: size.width * 0.8,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: MyTheme.ambapp,
                    //color: Colors.cyan,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Verification',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Enter OTP sent to your registered mobile number',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 110,
                          width: 900,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: OtpTextField(
                              keyboardType: TextInputType.number,
                              fillColor: MyTheme.ambapp4,
                              filled: true,
                              cursorColor: Colors.blue,
                              fieldWidth: 70,

                              numberOfFields: 4,
                              borderColor: MyTheme.ambapp3,
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) async {
                                await _getGeoLocationPosition();
                                await _otpVerifyController
                                    .callOtpApi(verificationCode);
                                _homePageController.AllServicesApi();
                                _homePageController.sliderBannerApi();
                                _homePageController.onInit();

                                /* showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        title: Text("Verification Code"),
                                        content: Text('Code entered is $verificationCode'),
                                      );
                                    }
                                );*/
                              }, // end onSubmit
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                            //_otpVerifyController.callOtpApi(verificationCode);
                          },
                          child: Container(
                            height: 45,
                            width: 270,
                            decoration: BoxDecoration(
                              color: MyTheme.ambapp9,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.15, 0))
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.035,
                                ),
                              ),
                              //"Continue".text.bold.center.size(14).make()
                            ),
                          ),
                        ),
                        //     .onTap(() {
                        //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsProfile()));
                        // }
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    await Future.delayed(Duration(seconds: 2));
    await Get.dialog(
      // bool barrierDismissible = true

      AlertDialog(
        title: const Text('Ambrd Apps'),
        content: const Text(
            """When you grant permission for  location access in our application, we may collect and process certain information related to your geographical location. This includes GPS coordinates, Wi-Fi network information, cellular tower data, Background Location, and other relevant data sources to determine your device's location."""),
        actions: [
          TextButton(
            child: const Text("Reject"),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text("Accept"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      barrierDismissible: false,
    );

    ///...start..
    // Future<bool> _handleLocationPermission() async {
    //   bool serviceEnabled;
    //   LocationPermission permission;
    //
    //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //   if (!serviceEnabled) {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text(
    //             'Location services are disabled. Please enable the services')));
    //     return false;
    //   }
    //   permission = await Geolocator.checkPermission();
    //   if (permission == LocationPermission.denied) {
    //     permission = await Geolocator.requestPermission();
    //     if (permission == LocationPermission.denied) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //           const SnackBar(content: Text('Location permissions are denied')));
    //       return false;
    //     }
    //   }
    //   if (permission == LocationPermission.deniedForever) {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text(
    //             'Location permissions are permanently denied, we cannot request permissions.')));
    //     return false;
    //   }
    //
    //   return true;
    // }

    /// ....end

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.value('');
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
}
