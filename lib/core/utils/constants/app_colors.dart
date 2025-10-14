import 'package:flutter/material.dart';
import 'package:mainland/core/utils/extensions/extension.dart';

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

  static const Color transparent = Colors.transparent;
  // Theme-sourced colors (use getters to avoid early init and allow live theme changes)
  static Color get surfaceBG => getTheme.colorScheme.surface;
  // DEPRECATED: use surfaceBG
  static Color get serfeceBG => surfaceBG;
  static Color get primaryText => getTheme.colorScheme.onSurface;
  // Brand primary (sourced from ColorScheme.primary for M3 correctness)
  static Color get primaryColor => getTheme.colorScheme.primary;
  static Color get onPrimaryColor => getTheme.colorScheme.onPrimary;
  static const textWhite = Color(0xffFFFFFF);
  // Neutrals (some mapped to theme for better consistency)
  static Color get iconColorBlack => getTheme.colorScheme.onSurface;
  // Surfaces
  static Color get secondaryColor => getTheme.colorScheme.surface;
  // Buttons / states
  static Color get primaryButton => getTheme.colorScheme.primary;
  static Color get secondaryText => getTheme.colorScheme.onSurfaceVariant;
  static Color get disable => getTheme.colorScheme.outlineVariant;
  static Color get outlineColor => getTheme.colorScheme.outline;
  static const primary50 = Color(0xFFE6F4EA);
  static const success = Color(0xff008000);
  static const warning = Color(0xffFF5B00);
  static Color get error => getTheme.colorScheme.error;
  static Color get background => const Color(0xFFF4F4F4);
  static Color get greay500 => const Color(0xFF333333);
  static Color get white300 => const Color(0xFFF0F0F0);
  static Color get backgroundWhite => const Color.fromARGB(255, 255, 255, 255);
  static Color get greay50 => const Color(0xFFEBEBEB);

}
