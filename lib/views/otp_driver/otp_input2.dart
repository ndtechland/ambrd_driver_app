// import 'package:flutter/material.dart';
//
// class OtpInput2 extends StatelessWidget {
//   const OtpInput2(
//       {Key? key,
//       required this.controller,
//       required this.autoFocus,
//       required this.validator})
//       : super(key: key);
//   final bool autoFocus;
//   final TextEditingController controller;
//   final String? Function(String?) validator;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(16),
//       child: SizedBox(
//         height: 60,
//         width: 150,
//         child: PhysicalModel(
//           color: Color(0xfff5f5f5),
//           shape: BoxShape.circle,
//           elevation: 2,
//           child: Container(
//             height: 120,
//             width: 180,
//             decoration: BoxDecoration(
//               border: Border.all(color: Color(0xfff5f5f5), width: 0),
//               shape: BoxShape.circle,
//               color: Color(0xfff5f5f5),
//
//               //borderRadius: BorderRadius.circular(5)
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   contentPadding:
//                       EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//                   border: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   hintText: '',
//                   hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
//                   counterText: '',
//                   focusColor: Colors.black,
//                 ),
//                 autofocus: autoFocus,
//                 textAlign: TextAlign.center,
//                 keyboardType: TextInputType.number,
//                 controller: controller,
//                 validator: validator,
//                 maxLength: 1,
//                 onChanged: (value) {
//                   if (value.length == 1) {
//                     FocusScope.of(context).nextFocus();
//                   }
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
