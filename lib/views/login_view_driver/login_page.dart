import 'package:ambrd_driver_app/controllers/signup_controller.dart';
import 'package:ambrd_driver_app/widget/exit_popscope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constantsss/app_theme/app_color.dart';
import '../../constantsss/widgets/button_custom.dart';
import '../../controllers/login_driver_mobile_controller/login_mobile_controllers.dart';
import '../sign_up_page_driver/sign_up_pagee.dart';

class LoginScreen extends GetView<LoginMobileController> {
  //const LoginScreen({Key? key}) : super(key: key);

  LoginMobileController _loginMobileController =
      Get.put(LoginMobileController());
  SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(LoginMobileController());
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: MyTheme.ambapp3,
        body: Obx(
          () => _loginMobileController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _loginMobileController.MobileLoginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SafeArea(
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: SingleChildScrollView(
                        // padding: const EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //SizedBox(height: height * 0.05),
                            Lottie.asset('assets/animation_phone2.json',
                                //'assets/phoneanimation2.gif',

                                // 'assets/animation_lnk7o8on.zip',
                                height: height * 0.23),

                            // Image.asset(
                            //   'lib/assets/images/111424-phone-verification-otp-animation.gif',
                            //   height: height * 0.2,
                            // ),
                            SizedBox(height: height * 0.05),
                            Text(
                              "Please Verify Your Phone!",
                              style: GoogleFonts.alegreyaSc(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.ambapp),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              "Sign In",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.ambapp),
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              height: height * 0.65,
                              width: width,
                              decoration: BoxDecoration(
                                color: MyTheme.drivrbackgrnd,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20)),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: height * 0.03),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller:
                                          _loginMobileController.MobileOrEmail,
                                      //controller.emailController,
                                      obscureText: false,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        return _loginMobileController
                                            .validatePhone(value!);
                                      },
                                      decoration: InputDecoration(
                                        //border: InputBorder.none,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1),
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 8.0, top: 13.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.red,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.7),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(15.7),
                                        ),

                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/pnone4.png",
                                            color: MyTheme.ambapp1,
                                            height: 10,
                                            width: 10,
                                          ),
                                        ),
                                        fillColor: MyTheme.drivrtextfield,
                                        filled: true,
                                        suffixIcon: null ?? const SizedBox(),
                                        hintText: "Enter Your Mobile",
                                        hintStyle: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        // contentPadding:
                                        //const EdgeInsets.only(top: 16.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.0),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "You Not Registered?",
                                          style: GoogleFonts.alegreyaSc(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              color: MyTheme.ambapp2),
                                        ),
                                        SizedBox(height: height * 0.03),
                                        InkWell(
                                          onTap: () async {
                                            await _signUpController
                                                .getStateApi();
                                            _signUpController.update();

                                            _signUpController.refresh();
                                            await Get.to(() => SignUpPage());
                                          },
                                          child: Text(
                                            "SIGNUP",
                                            style: GoogleFonts.alegreyaSc(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: MyTheme.ambapp1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: height * 0.05),
                                  CustomButton(
                                    onTap: () {
                                      //SignUpPage
                                      _loginMobileController.checkMobileLogin();

                                      ///Get.to(() => OTPPhone());
                                      // Get.to(() => AddBanner());
                                      // Get.to(() => HomePage());
                                    },
                                    btnText: 'Verify',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
