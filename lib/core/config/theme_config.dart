// Flutter imports:
import 'package:flutter/material.dart';

enum ThemeKey { light, dark, system }

abstract class AppTheme {
  String get key;
  Color get backgroundColorPrimary;
  Color get backgroundColorSecondary;
  Color get textColorPrimary;
  Color get textColorSecondary;
  Color get accentColor;

  ///Static Colors
  final Color appColorWhite = const Color(0xFFFFFFFF);
  final Color appColorDark = const Color(0xFF000000);
  final Color accentBlue = const Color(0xFF409CFF);
  final Color accentRed = const Color(0xFFFF6961);
  final Color accentGreen = const Color(0xFF30D158);
  final Color accentYellow = const Color(0xFFFFC400);
}

class AppDarkTheme extends AppTheme {
  @override
  String key = ThemeKey.dark.name;

  @override
  Color accentColor = const Color(0xFFC9FC6E);

  @override
  Color backgroundColorPrimary = const Color(0xFF000000);

  @override
  Color backgroundColorSecondary = const Color(0xFF1F1F1F);

  @override
  Color textColorPrimary = const Color(0xFFFFFFFF);

  @override
  Color textColorSecondary = const Color(0xFF7F7F81);
}

class AppLightTheme extends AppTheme {
  @override
  String key = ThemeKey.light.name;

  @override
  Color accentColor = const Color(0xFF388E3C);

  @override
  Color textColorPrimary = const Color(0xFF1A1A1A);

  @override
  Color textColorSecondary = const Color(0xFF616161);

  @override
  Color backgroundColorPrimary = const Color(0xFFF8F9FA);

  @override
  Color backgroundColorSecondary = const Color(0xFFECEFF1);

}
