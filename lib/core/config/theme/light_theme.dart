import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainland/core/utils/constants/app_colors.dart';
// String fontFamily = 'Times New Roman';
String fontFamily = 'Selawik';
final TextTheme baseTextTheme = ThemeData.light().textTheme.apply(fontFamily: fontFamily);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fontFamily,
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF00B050),
    onPrimary: Colors.black,
    secondary: Color(0xFF00B050),
    onSecondary: Colors.white,
    error: Color(0xFFE53935),
    onError: Colors.white,
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF333333),
    surfaceContainerLowest: Color(0xFFF9F9F9),
    surfaceContainerLow: Color(0xFFF1F4F4),
    surfaceContainer: Color(0xFFE6F1F1),
    surfaceContainerHigh: Color(0xFFDDEBEB),
    surfaceContainerHighest: Color(0xFFD2E5E5),
    onSurfaceVariant: Color(0xFF666666),
    inverseSurface: Color(0xFF333333),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF4DB8BF),
    outline: Color(0xFFA1A1A1),
    outlineVariant: Color(0xFFEDF1F3),
    shadow: Color(0x1F000000),
    scrim: Color(0x80000000),
    surfaceTint: Color(0xFF00B050),
  ),
  scaffoldBackgroundColor: const Color(0xFFF4F4F4),

  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF333333),
    elevation: 0,
  ),

  searchBarTheme: SearchBarThemeData(
    hintStyle: const WidgetStatePropertyAll(
      TextStyle(color: Color(0xFF979797), fontStyle: FontStyle.italic),
    ),
    backgroundColor: WidgetStatePropertyAll(AppColors.background),
  ),

  // Full TextTheme with Selawik applied
  textTheme: baseTextTheme.copyWith(
    headlineLarge: baseTextTheme.headlineLarge?.copyWith(
      fontSize: 32.sp,
      height: 38 / 32,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF333333),
    ),
    headlineMedium: baseTextTheme.headlineMedium?.copyWith(
      fontSize: 28.sp,
      height: 34 / 28,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF333333),
    ),
    headlineSmall: baseTextTheme.headlineSmall?.copyWith(
      fontSize: 24.sp,
      height: 28 / 24,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF333333),
    ),
    titleLarge: baseTextTheme.titleLarge?.copyWith(
      fontSize: 18.sp,
      height: 28 / 18,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF333333),
    ),
    titleMedium: baseTextTheme.titleMedium?.copyWith(
      fontSize: 16.sp,
      height: 24 / 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF333333),
    ),
    titleSmall: baseTextTheme.titleSmall?.copyWith(
      fontSize: 14.sp,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF333333),
    ),
    bodyLarge: baseTextTheme.bodyLarge?.copyWith(
      fontSize: 16.sp,
      height: 24 / 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF333333),
    ),
    bodyMedium: baseTextTheme.bodyMedium?.copyWith(
      fontSize: 16.sp,
      height: 24 / 16,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF333333),
    ),
    bodySmall: baseTextTheme.bodySmall?.copyWith(
      fontSize: 14.sp,
      height: 20 / 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF858585),
    ),
    labelLarge: baseTextTheme.labelLarge?.copyWith(
      fontSize: 18.sp,
      height: 24 / 18,
      fontWeight: FontWeight.w700,
      color: const Color(0xFFFFFFFF),
    ),
    labelMedium: baseTextTheme.labelMedium?.copyWith(
      fontSize: 14.sp,
      height: 16 / 14,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFFFFFFF),
    ),
    labelSmall: baseTextTheme.labelSmall?.copyWith(
      fontSize: 12.sp,
      height: 14 / 12,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF858585),
    ),
  ),

  // Card & divider
  cardColor: const Color(0xFFE6F1F1),
  dividerColor: const Color(0xFFCCCCCC),

  // Text selection & cursor
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: const Color(0xFF00B050),
    selectionColor: const Color(0xFF00B050).withOpacity(0.33),
    selectionHandleColor: const Color(0xFF00B050),
  ),

  // Input decoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.transparent,
    border: _buildBorder(color: const Color(0xFFC2C2C2)),
    enabledBorder: _buildBorder(color: const Color(0xFFC2C2C2)),
    focusedBorder: _buildBorder(color: const Color(0xFF00B050)),
    disabledBorder: _buildBorder(color: const Color(0xFFC2C2C2)),
    errorBorder: _buildBorder(color: const Color(0xFFE53935)),
    hintStyle: const TextStyle(fontFamily: 'Selawik', fontSize: 14, color: Color(0xFF979797)),
    labelStyle: const TextStyle(fontFamily: 'Selawik', fontSize: 14, color: Color(0xFFBFBFBF)),
    errorStyle: const TextStyle(fontFamily: 'Selawik', fontSize: 12, color: Color(0xFFE53935)),
  ),
);

OutlineInputBorder _buildBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );
}
