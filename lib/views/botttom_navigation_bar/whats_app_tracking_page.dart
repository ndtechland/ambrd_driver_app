// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// //import 'package:gyros_app/constants/app_colors.dart';
// //import 'package:sizer/sizer.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// //import '../wave_view_tracking/wave_views_trackings.dart';
//
// final Uri _url = Uri.parse('https://www.instagram.com/');
// final Uri _url2 = Uri.parse('https://www.facebook.com/');
// final Uri _url3 = Uri.parse('https://twitter.com/');
//
// class WhatsAppTrackOrder extends StatelessWidget {
//   const WhatsAppTrackOrder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 color: Colors.white,
//                 width: size.width,
//                 height: size.height,
//                 child: Column(
//                   children: [
//                     Container(
//                       color: AppColors.themecolors,
//                       height: size.height * 0.3,
//                       width: double.infinity,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         // mainAxisAlignment:MainAxisAlignment.spaceBetween ,
//                         children: [
//                           SizedBox(
//                             height: 3.h,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 4.w, vertical: 2.h),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 1.w, vertical: 0.h),
//                                   child: Text(
//                                     'Any Doubt ?',
//                                     style: GoogleFonts.radioCanada(
//                                       color: Colors.white,
//                                       letterSpacing: 2,
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 23,
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     Get.back();
//                                   },
//                                   child: Container(
//                                     width: 8.w,
//                                     height: 4.h,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: Colors.black12,
//                                     ),
//                                     child: Icon(
//                                       Icons.clear,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 5.w, vertical: 0.h),
//                             child: Text(
//                               'We are here to help!',
//                               style: GoogleFonts.radioCanada(
//                                 color: Colors.white,
//                                 letterSpacing: 1,
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 13,
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 10.h,
//                             width: 50.w,
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 4.w, vertical: 2.h),
//                               child: Row(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       _launchUrl();
//                                     },
//                                     child: Image.asset(
//                                       'lib/assets/asset/instagram.png',
//                                       height: 4.h,
//                                       width: 8.w,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: InkWell(
//                                       onTap: () {
//                                         _launchUrl2();
//                                       },
//                                       child: Image.asset(
//                                         'lib/assets/asset/facebook.png',
//                                         height: 4.h,
//                                         width: 8.w,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                   InkWell(
//                                     onTap: () {
//                                       _launchUrl3();
//                                     },
//                                     child: Image.asset(
//                                       'lib/assets/asset/twitter.png',
//                                       height: 4.h,
//                                       width: 8.w,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 24.h,
//                 left: 5.w,
//                 right: 5.w,
//                 child: PhysicalModel(
//                   color: Colors.white10,
//                   borderRadius: BorderRadius.circular(5),
//                   elevation: 2,
//                   child: Container(
//                     height: 17.h,
//                     width: 90.w,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5),
//                       //border: Border.all(color: Colors.grey, width: 0.5)
//                     ),
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Contact Us',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               _launchWhatsapp();
//                             },
//                             child: Container(
//                               height: 5.5.h,
//                               width: 90.w,
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.grey)),
//                               child: Row(
//                                 children: [
//                                   Image.asset(
//                                     'lib/assets/asset/whatsapp.png',
//                                     height: 4.h,
//                                     width: 8.w,
//                                     //color: Colors.green,
//                                   ),
//                                   Text('   Whatsapp Chat')
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 44.h,
//                 left: 5.w,
//                 right: 5.w,
//                 child: PhysicalModel(
//                   color: Colors.white10,
//                   borderRadius: BorderRadius.circular(5),
//                   elevation: 2,
//                   child: Container(
//                     height: 22.h,
//                     width: 90.w,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5),
//                       //border: Border.all(color: Colors.grey, width: 0.5)
//                     ),
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'View Order Status',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Text(
//                             'Track Your Order',
//                             style: TextStyle(
//                               fontSize: 12,
//                               color: Colors.grey,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               print(Get.currentRoute);
//                               Get.back();
//                               Get.to(() => WebViewTracking());
//                               //Tracking());
//                               Get.offNamed('/WebViewTracking');
//                             },
//                             child: Container(
//                               height: 5.5.h,
//                               width: 90.w,
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.grey)),
//                               child: Row(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(8.0),
//                                     child: Icon(Icons.car_rental),
//                                   ),
//                                   Text(
//                                     'Track your order',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 13),
//                                   ),
//
//                                   ///transform bpx
//                                   // RotatedBox(
//                                   //   quarterTurns: 4,
//                                   //   child: Icon(
//                                   //     Icons.login,
//                                   //     color: Colors.black,
//                                   //   ),
//                                   // ),
//                                   // AnimatedContainer(
//                                   //   duration: Duration(seconds: 2),
//                                   //   color: Colors.black,
//                                   //   height: 3.h,
//                                   //   width: 6.w,
//                                   // ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   ///todo from here whats app launch in flutter
//
//   _launchWhatsapp() async {
//     var whatsapp = "+919716412565";
//     var whatsappAndroid =
//         Uri.parse("whatsapp://send?phone=$whatsapp&text=hello Prince");
//     if (await canLaunchUrl(whatsappAndroid)) {
//       await launchUrl(whatsappAndroid);
//     } else {
//       Get.snackbar(
//         "Whats App not installed ",
//         "Please install the what's app Prince",
//         colorText: Colors.red.shade400,
//         backgroundColor: Colors.white10,
//         icon: Icon(Icons.person, color: Colors.red),
//         snackPosition: SnackPosition.TOP,
//       );
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text("WhatsApp is not installed on the device"),
//       //   ),
//       // );
//     }
//   }
// }
//
// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw 'Could not launch $_url';
//   }
// }
//
// Future<void> _launchUrl2() async {
//   if (!await launchUrl(_url2)) {
//     throw 'Could not launch $_url';
//   }
// }
//
// Future<void> _launchUrl3() async {
//   if (!await launchUrl(_url3)) {
//     throw 'Could not launch $_url';
//   }
// }
