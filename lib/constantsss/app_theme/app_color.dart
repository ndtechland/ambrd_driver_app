import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color t1bacgroundcolors1 = Color(0xffDA1212);
  static Color t1navbar1 = Color(0xff11468F);
  static Color t1containercolor = Color(0xff041562);
  static Color t1Iconcolor = Color(0xffEEEEEE);
  static Color ambapptextfield = Color(0xffa6a6a6);
  static Color ambapptextfield2 = Color(0xffefebf1);

  static Color t22Iconcolor = Color(0xff3E64FF);
  static Color drivrtextfield = Color(0xffFFEBEB);

  static Color drivrbackgrnd = Color(0xff77aaff);

  //B2FCFF

  static var ambapp = Color(0xff11468F);
  static var ambapp1 = Color(0xffDA1212);
  static var ambapp2 = Color(0xff041562);
  //static var ambapp3 = Color(0xffFFACAC);
  static var ambapp3 = Color(0xffffffff);

  /// Colors.white;
  static var ambapp4 = Color(0xffFFFFFF);
  static var ambapp5 = Color(0xff071952);
  static var ambapp6 = Color(0xffFCFCFC);

  static var ambapp7 = Color(0xffFEF9EF);
  static var ambapp8 = Color(0xffF8F1F1);
  static var ambapp9 = Color(0xffFDEFF4);
  static var ambapp10 = Color(0xffFFD1DA);
  static var ambapp11 = Color(0xffE8F6EF);
  static var ambapp12 = Color(0xfff8dedd);
  static var ambapp13 = Color(0xfff4cdcc);

  ///logo222.png
  /// LOGOammbpng.png
  static Color bacgroundcolors = Color(0xffFFEEEE);
  static Color primarycolorr = Color(0xffFFF6EA);
  static Color primary2 = Color(0xffF7E9D7);
  static Color primary3 = Color(0xffF7E9D7);
  static Color loginbuttonColor = Color(0xff9bbb4c);
  static Color signUpButtonColor = Colors.grey.shade400;
  // static Color loginPageBoxColor = Color(0xffccccff);
  static Color loginPageBoxColor = Colors.grey.shade300;
  static Color ContainerUnSelectedColor = Color(0xffeff8f5);
  static Color ThemeColors = Color(0xff27ae61);
  static double defaultPading = 15.0;
  static Color containercolor1 = Color(0xff8cdba9);
  static Color containercolor2 = Color(0xffa5f0c5);
  static Color containercolor3 = Color(0xffd5f591);
  static Color containercolor4 = Color(0xffffc06e);
  static Color containercolor5 = Color(0xff019875);
  static Color containercolor6 = Color(0xff596e5c);
  static Color containercolor7 = Color(0xffEEEEEE);
  static Color containercolor8 = Color(0xffa9c7ac);
  static Color containercolor9 = Color(0xffd1aca5);
  static Color containercolor10 = Color(0xffe2cfc9);
  static Color containercolor11 = Color(0xff006400);
  static Color containercolor12 = Color(0xff3a923b);
  static Color containercolor13 = Color(0xffb5d047);
  //184704
  static Color containercolor14 = Color(0xff236706);
  static Color containercolor15 = Color(0xff184704);
  static Color containercolor16 = Color(0xffc9c702);
  static Color containercolor17 = Color(0xff0b806b);
  static Color containercolor18 = Color(0xffd11a2a);
  static LinearGradient gradient1 = const LinearGradient(
    colors: <Color>[
      Color(0xff2cc487),
      Color(0xff2cc499),
      Color(0xff3ad286),
      Color(0xff6ec481),
      Color(0xff37c97e),
      Color(0xff47bd82),
      Color(0xff209c87),
      Color(0xff0b806b),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.topLeft,
    end: Alignment(0.9, 1),
  );

  static LinearGradient gradient2 = const LinearGradient(
    colors: <Color>[
      Color(0xff0b806b),
      Color(0xff47bd82),
      Color(0xff0b806b),
      // Color(0xff6ec481),
      // Color(0xff37c97e),
      // Color(0xff47bd82),
      // Color(0xff209c87),
      // Color(0xff0b806b),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static SweepGradient sweepGradient1 = SweepGradient(
    colors: [
      Colors.blue.shade400,
      Colors.green.shade200,
      Colors.yellow.shade300,
      Colors.red,
      Colors.blue.shade400,
    ],
    stops: [0.0, 0.25, 0.5, 0.70, 1],
  );

  static RadialGradient radial1 = RadialGradient(
      colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink],
      stops: [0.2, 0.5, 0.7, 1]);

  static LinearGradient gradient3 = const LinearGradient(
    colors: <Color>[
      Color(0xff47bd82),
      Color(0xff47bd82),
      Color(0xff209c87),
      // Color(0xff6ec481),
      // Color(0xff37c97e),
      // Color(0xff47bd82),
      // Color(0xff209c87),
      // Color(0xff0b806b),
    ],
    tileMode: TileMode.mirror,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient gradient4 =
      const LinearGradient(colors: [Colors.green, Colors.blue]);

  static LinearGradient gradient5 =
      const LinearGradient(colors: [Colors.red, Colors.yellowAccent]);

  static LinearGradient gradient6 = LinearGradient(
    colors: [
      const Color(0xffD6FF7F),
      //Colors.blueGrey.shade500,
      const Color(0xff00B3CC)
    ],

    // begin: const FractionalOffset(0.0, 0.0),
    // end: const FractionalOffset(1.0, 0.0),
    // stops: [0.0, 1.0],
    // tileMode: TileMode.clamp,
  );

  static LinearGradient gradient12 = LinearGradient(
    colors: [
      const Color(0xff3a923b),
      const Color(0xffb5d047),
      //Colors.blueGrey.shade500,
    ],

    // begin: const FractionalOffset(0.0, 0.0),
    // end: const FractionalOffset(1.0, 0.0),
    // stops: [0.0, 1.0],
    // tileMode: TileMode.clamp,
  );

  static LinearGradient gradient7 = LinearGradient(
    colors: [
      Color(0xFF0061ff),
      Color(0xFF60efff),
    ],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );

  static LinearGradient gradient8 =
      const LinearGradient(colors: [Color(0xff402565), Color(0xff30BE96)]);

  static LinearGradient gradient9 = const LinearGradient(
    colors: [
      Color.fromARGB(255, 148, 231, 225),
      Color.fromARGB(255, 62, 182, 226)
    ],
  );

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        canvasColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        hoverColor: Color(0xff27ae61),
        //Color(0xff25D366);
        //Color(0xff9bbb4c);

        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.white,
            onPrimary: Colors.black87,
            secondary: Colors.black87,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.black,
            onBackground: Colors.black,
            surface: Colors.cyan.shade500,
            onSurface: Colors.cyan),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        canvasColor: Colors.black,
        hoverColor: Color(0xff27ae61),
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: Colors.black87,
            onSecondary: Colors.black,
            error: Colors.red,
            onError: Colors.red,
            background: Colors.black,
            onBackground: Colors.black,
            surface: Colors.cyan.shade500,
            onSurface: Colors.cyan),
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
}

class AppColors {
  static const Color mainColor = Color(0xff2031C9);
  static const Color primaryColor = Color(0xff1f08ab);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color greyColor = Color(0xff7a7a7a);
}
