import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_theme/app_color.dart';

class CustomButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback? onTap;
  final Color? btnColor;
  final Color? onPrimaryColor;
  final Widget? btnDataRow;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.btnText,
    this.btnColor = AppColors.whiteColor,
    this.btnDataRow,
    this.onPrimaryColor = AppColors.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: onPrimaryColor,
          backgroundColor: MyTheme.ambapp2,
          minimumSize: Size(width, height * 0.055),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: btnDataRow ??
            Center(
              child: Text(
                btnText!,
                style: GoogleFonts.poppins(
                  color: MyTheme.containercolor7,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
      ),
    );
  }
}
