import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_theme/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final String prefixIconPath;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.keyboardType,
    required this.prefixIconPath,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 50.0,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: MyTheme.t1bacgroundcolors1,
        //AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        style: GoogleFonts.poppins(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
        cursorHeight: height * 0.02,
        obscureText: obscureText,
        cursorColor: MyTheme.t1Iconcolor,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              prefixIconPath,
              color: MyTheme.t1Iconcolor,
              height: 10,
              width: 10,
            ),
          ),
          suffixIcon: suffixIcon ?? const SizedBox(),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: const EdgeInsets.only(top: 16.0),
        ),
      ),
    );
  }
}
