// import 'package:ambrd_appss/constants/app_theme/app_color.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'otp_input.dart';
// import 'otp_timer_controllers.dart';
//
// class OTPPage extends StatelessWidget {
//   OTPPage({
//     Key? key,
//   }) : super(key: key);
//
//   OtpTimerController _timeController = Get.put(OtpTimerController());
//
//   //OtpTimerController2 _timeController2 = Get.put(OtpTimerController2());
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       key: _timeController.otpKey,
//       child: Scaffold(
//         backgroundColor: MyTheme.t1bacgroundcolors1,
//         //backgroundColor: Colors.red,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: MyTheme.t1bacgroundcolors1,
//           // leading: Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: Image.asset(
//           //     'lib/assets/asset/arrow.png',
//           //     height: 20,
//           //     width: 40,
//           //   ),
//           //   //     .onTap(() {
//           //   //   Get.back();
//           //   // }),
//           // ),
//           title: Text(
//             'VERIFY YOUR MOBILE AND EMAIL ID',
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: MyTheme.ambapp4,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 Center(
//                     child: Image.asset(
//                   'lib/assets/images/logo222.png',
//                   height: 220,
//                 )),
//                 SizedBox(
//                   height: 0,
//                 ),
//                 Text(
//                   'OTP ON MOBILE',
//                   style: GoogleFonts.poppins(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'We have sent the code verification to Your',
//                   style: GoogleFonts.raleway(
//                     color: Colors.grey,
//                     fontSize: 11,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'Mobile number',
//                   style: GoogleFonts.raleway(
//                     color: Colors.grey,
//                     fontSize: 11,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     for (int i = 0; i < 4; i++)
//                       OtpInput(
//                           validator: _timeController.otpValidator,
//                           controller: _timeController.phoneotp[i],
//                           autoFocus: i == 0 ? true : false),
//                   ],
//                 ),
//                 Text(
//                   'RESEND OTP ON MOBILE',
//                   style: GoogleFonts.poppins(
//                     color: Colors.black,
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Text(
//                   'OTP ON EMAIL ID',
//                   style: GoogleFonts.poppins(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'We have sent the code verification to Your',
//                   style: GoogleFonts.raleway(
//                     color: Colors.grey,
//                     fontSize: 11,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   'EmailID',
//                   style: GoogleFonts.raleway(
//                     color: Colors.grey,
//                     fontSize: 11,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     for (int i = 0; i < 4; i++)
//                       OtpInput(
//                           validator: _timeController.otpValidator,
//                           controller: _timeController.emailotp[i],
//                           autoFocus: i == 0 ? true : false),
//                   ],
//                 ),
//                 Text(
//                   'RESEND OTP ON EMAIL',
//                   style: GoogleFonts.poppins(
//                     color: Colors.black,
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     // Get.to(() => CardVerifications1());
//                     _timeController.otpdigits();
//                     _timeController.otpdigits2();
//                     //_timeController.VerifyotpApi();
//                     _timeController.checkValidation();
//                     // Get.to(()=>OTPPage());
//
//                     // _userProfileController.calluserProfileApi();
//                   },
//                   child: Container(
//                     height: 40,
//                     width: 330,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.yellow,
//                     ),
//                     child: Center(
//                       child: Text(
//                         'VERIFY NOW',
//                         style: GoogleFonts.poppins(
//                             color: Colors.white,
//                             letterSpacing: 1,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 12),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
