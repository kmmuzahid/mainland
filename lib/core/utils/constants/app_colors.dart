import 'package:flutter/material.dart';

class AppColors {
  static List<Color> predefinedColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.black,
    Colors.white,
  ];
  // static const Color rewardPointsColor = Colors.orangeAccent;
  // static const Color secondary = Color.fromRGBO(51, 51, 51, 1);
  // static const Color background = Colors.white;

  // static const Color white = Colors.white;
  // static const Color black = Colors.black;
  // static const Color red = Colors.red;
  // static const Color filledColor = Color.fromARGB(0, 255, 255, 255);
  // static const Color textFiledColor = Color(0xFF979797);
  // static const Color textFiledBorder = Color.fromRGBO(8, 89, 95, 1);
  // static const Color disableColor = Color.fromRGBO(194, 194, 194, 1);

  // static const blueLight = Color(0xffe8e8f5);

  // App colors (base)
  static const Color transparent = Colors.transparent;
  // Keep old typo as alias for backward compatibility
  static const surfaceBG = Color(0xffFFFFFF);
  static const serfeceBG = surfaceBG; // DEPRECATED: use surfaceBG
  static const primaryText = Color(0xff333333);
  static const primaryColor = Color(0xff00B050); // Brand primary
  static const brandColor = primaryColor; // Alias for clarity
  static const textWhite = Color(0xffFFFFFF);
  static const primaryColor2 = Color(0xffFFA500); // Accent 1
  static const primaryColor3 = Color(0xffDE1B29); // Accent 2
  static const stock = Color(0xff181C14);
  static const stock2 = Color(0xffBFBFBF);
  static const iconColorBlack = Color(0xff181C14);
  static const iconColorWhite = Color(0xffFFFFFF);
  static const cartBG = Color(0xffE6F1F1);
  static const cartBG3 = Color(0xffE9FFE5);
  static const cartBG4 = Color(0xffFFF1F1);
  static const cartBG5 = Color(0xffFFF8E1);
  static const cartBG6 = Color(0xffE5E7EB);
  static const cartBG2 = Color(0xffF5F5F5);
  static const primaryButton = Color(0xff00B050);
  static const secondaryColor = Color(0xffE6F1F1);
  static const secondaryText = Color(0xff858585);
  static const disable = Color(0xffC2C2C2);
  static const success = Color(0xff008000);
  static const warning = Color(0xffFF5B00);
  static const error = Color(0xffFF2C2C);
  static const lightRead = Color(0xffFFAFAF); // (typo kept as-is to avoid breaking changes)
  static const stockWhite = Color(0xffFFFFFF);
  
  // Gradients (brand-aligned)
  // Button gradient (updated to green range)
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF009443), Color(0xFF00B050)],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  // Optional: radial brand backgrounds
  static const RadialGradient radial = RadialGradient(
    center: Alignment.center,
    radius: 1.0,
    colors: [Color(0xFFB7F0C5), Color(0xFF00B050)],
  );

  static const RadialGradient radialUp = RadialGradient(
    center: Alignment.topCenter,
    radius: 1.2,
    colors: [Color(0xFFE6F7EA), Color(0xFF00B050)],
  );
}
