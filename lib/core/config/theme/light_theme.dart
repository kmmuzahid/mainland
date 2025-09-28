import 'package:mainland/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Using bundled font family 'Selawik' configured in pubspec.yaml

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'Selawik',

  // Color scheme aligned with AppColors
  colorScheme: const ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primaryColor, // 🟦 Primary: Buttons, active tabs
    onPrimary: Color(0xFFFFFFFF), // 🔳 Text/icons on primary

    secondary: AppColors.primaryButton, // 🟢 Secondary: Chips, toggles
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
    surfaceTint: AppColors.primaryColor, // 🎨 Tint applied on elevated surfaces
  ),

  scaffoldBackgroundColor: Colors.white, // 📱 Screen background

  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent, // 🧼 Disable elevation tint
    backgroundColor: Colors.white, // 🎛 AppBar surface
    foregroundColor: Color(0xFF333333), // 📝 AppBar text/icon color
    elevation: 0,
  ),

  // Typography mapped to provided scale (Selawik)
  textTheme: TextTheme(
    // Headings
    headlineLarge: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 32.sp, // H3 32/38
      height: 38 / 32,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 28.sp, // H4 28/34
      height: 34 / 28,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 24.sp, // H5 24/28
      height: 28 / 24,
      fontWeight: FontWeight.w600,
    ),

    // Subtitles
    titleLarge: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 18.sp, // S1 18/28
      height: 28 / 18,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 16.sp, // S2 16/24
      height: 24 / 16,
      fontWeight: FontWeight.w600,
    ),

    // Body
    bodyLarge: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 16.sp, // B1 16/24
      height: 24 / 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 16.sp, // B2 16/24
      height: 24 / 16,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF858585),
      fontSize: 14.sp, // B3 14/20
      height: 20 / 14,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFF333333),
      fontSize: 14.sp, // B4 14/20
      height: 20 / 14,
      fontWeight: FontWeight.w500,
    ),

    // Buttons (label* in M3)
    labelLarge: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFFFFFFFF),
      fontSize: 18.sp, // Giant 18/24
      height: 24 / 18,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFFFFFFFF),
      fontSize: 14.sp, // Medium 14/16
      height: 16 / 14,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      overflow: TextOverflow.fade,
      color: const Color(0xFFFFFFFF),
      fontSize: 12.sp, // Tiny 10/12
      height: 14 / 12,
      fontWeight: FontWeight.w600,
    ),
  ),

  cardColor: const Color(0xFFE6F1F1), // 🃏 Card surfaces

  dividerColor: const Color(0xFFCCCCCC), // ➖ Dividers

  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primaryColor,
    selectionColor: AppColors.primaryColor.withOpacity(0.33),
    selectionHandleColor: AppColors.primaryColor,
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent, // 🧾 TextField background
    border: _buildBorder(color: AppColors.disable),
    enabledBorder: _buildBorder(color: AppColors.disable),
    focusedBorder: _buildBorder(color: AppColors.primaryColor),
    disabledBorder: _buildBorder(color: AppColors.disable),
    errorBorder: _buildBorder(color: AppColors.error),
    hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF979797)),
    labelStyle: const TextStyle(fontSize: 14, color: Color(0xffBFBFBF)),
  ),
);

OutlineInputBorder _buildBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: color),
  );
}
