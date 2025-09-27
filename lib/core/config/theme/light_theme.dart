import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: const ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xFF0A6F77), // 🟦 Primary: Buttons, active tabs
    onPrimary: Color(0xFFFFFFFF), // 🔳 Text/icons on primary

    secondary: Color(0xFF008000), // 🟢 Secondary: Chips, toggles
    onSecondary: Color(0xFFFFFFFF), // ⚪ Text/icons on secondary

    error: Color(0xFFE53935), // 🔴 Error containers
    onError: Color(0xFFFFFFFF), // ⚪ Text/icons on error

    surface: Color(0xFFE6F1F1), // 🔲 Base surface: cards, modals
    onSurface: Color(0xFF333333), // 🔳 Text/icons on surface

    surfaceContainerLowest: Color(0xFFF9F9F9), // 🪵 Scaffold background / lowest elevation
    surfaceContainerLow: Color(0xFFF1F4F4), // 🪵 Lower elevation (forms, lists)
    surfaceContainer: Color(0xFFE6F1F1), // 🪵 Mid elevation surfaces
    surfaceContainerHigh: Color(0xFFDDEBEB), // 🪵 Higher elevation
    surfaceContainerHighest: Color(0xFFD2E5E5), // 🪵 Highest elevation: dialogs

    onSurfaceVariant: Color(0xFF666666), // 📝 Subtle/inactive text/icons

    inverseSurface: Color(0xFF333333), // 🔄 Reverse surface (e.g. pull-to-refresh)
    onInverseSurface: Color(0xFFFFFFFF), // ⚪ Text on inverseSurface

    inversePrimary: Color(0xFF4DB8BF), // 🔄 For contrast on dark background

    outline: Color(0xFFCCCCCC), // 📏 Borders, outlines
    outlineVariant: Color(0xFFE6F1F1), // 📏 Lower emphasis outlines

    shadow: Color(0x1F000000), // 🧱 Shadows for elevation
    scrim: Color(0x80000000), // 🚪 Overlays, modals
    surfaceTint: Color(0xFF0A6F77), // 🎨 Tint applied on elevated surfaces
  ),

  scaffoldBackgroundColor: Colors.white, // 📱 Screen background

  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent, // 🧼 Disable elevation tint
    backgroundColor: Colors.white, // 🎛 AppBar surface
    foregroundColor: Color(0xFF333333), // 📝 AppBar text/icon color
    elevation: 0,
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ), // 📝 Primary body text, font size 16
    bodyMedium: GoogleFonts.dmSans(
      textStyle: TextStyle(
        overflow: TextOverflow.fade,
        color: const Color(0xFF333333),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    ), // 📝 Secondary body text font size 14
    bodySmall: GoogleFonts.dmSans(
      textStyle: TextStyle(
        overflow: TextOverflow.fade,
        color: const Color(0xFF858585),
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      ),
    ), //font size 12

    titleLarge: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontWeight: FontWeight.bold,
      fontSize: 16.sp,
    ), // 🏷 Headings / Titles

    titleSmall: GoogleFonts.dmSans(
      textStyle: TextStyle(
        overflow: TextOverflow.fade,
        color: const Color(0xFF333333),
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),

  cardColor: const Color(0xFFE6F1F1), // 🃏 Card surfaces

  dividerColor: const Color(0xFFCCCCCC), // ➖ Dividers

  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xFF0A6F77),
    selectionColor: Color.fromARGB(85, 44, 153, 153),
    selectionHandleColor: Color.fromARGB(255, 10, 119, 119),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent, // 🧾 TextField background
    border: _buildBorder(color: AppColors.disable),
    enabledBorder: _buildBorder(color: AppColors.disable),
    focusedBorder: _buildBorder(color: AppColors.primaryColor),
    disabledBorder: _buildBorder(color: AppColors.disable),
    errorBorder: _buildBorder(color: AppColors.error),
    hintStyle: GoogleFonts.dmSans(fontSize: 14, color: const Color(0xFF979797)),
    labelStyle: GoogleFonts.dmSans(fontSize: 14, color: const Color(0xffBFBFBF)),
  ),
);

OutlineInputBorder _buildBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: color),
  );
}
