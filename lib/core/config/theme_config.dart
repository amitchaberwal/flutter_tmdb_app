// Flutter imports:
import 'package:flutter/material.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/core/extensions/widget_extension.dart';

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

class DefaultAppTheme {
  static ThemeData themeData(BuildContext context) => ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
      },
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: context.appTheme.backgroundColorSecondary,
    radioTheme: const RadioThemeData(
      visualDensity: VisualDensity.standard,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    primaryColor: context.appTheme.textColorPrimary,
    unselectedWidgetColor: context.appTheme.backgroundColorSecondary,
    colorScheme:
    ColorScheme.fromSeed(seedColor: context.appTheme.accentColor),
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      toolbarHeight: 70.0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: context.appTheme.textColorPrimary,
      ),
      backgroundColor: context.appTheme.backgroundColorSecondary,
    ),
    scrollbarTheme: ScrollbarThemeData(
      interactive: true,
      radius: const Radius.circular(24.0),
      thickness: WidgetStateProperty.resolveWith((_) => 4.0),
      minThumbLength: 32.0,
      thumbVisibility: WidgetStateProperty.resolveWith((_) => true),
      thumbColor: WidgetStateProperty.resolveWith(
            (states) => context.appTheme.accentColor,
      ),
      trackVisibility: WidgetStateProperty.resolveWith((_) => true),
      trackColor: WidgetStateProperty.resolveWith(
            (states) => context.appTheme.textColorPrimary,
      ),
      trackBorderColor: WidgetStateProperty.resolveWith(
            (states) => context.appTheme.textColorPrimary,
      ),
    ),
    sliderTheme: SliderThemeData(
      overlayShape: const RoundSliderOverlayShape(
        overlayRadius: 1,
      ),
      trackHeight: 4,
      trackShape: const RoundedRectSliderTrackShape(),
      activeTrackColor: context.appTheme.textColorSecondary,
      inactiveTrackColor:
      context.appTheme.textColorSecondary.withValues(alpha: 0.34),
      thumbColor: context.appTheme.textColorSecondary,
    ),
    switchTheme: SwitchThemeData(
      splashRadius: 24.0,
      thumbColor: context.appTheme.accentColor.wrapMatProp,
      trackColor: context.appTheme.backgroundColorPrimary.wrapMatProp,
    ),
    checkboxTheme: CheckboxThemeData(
      visualDensity: VisualDensity.standard,
      side: BorderSide(
        color: context.appTheme.textColorPrimary,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: context.appTheme.textColorSecondary,
      hintStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: context.appTheme.textColorSecondary,
      ),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        color: context.appTheme.textColorSecondary,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 1.5, color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: context.appTheme.textColorSecondary,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    drawerTheme: DrawerThemeData(
      scrimColor: context.appTheme.textColorPrimary.withValues(alpha: 0.75),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: context.appTheme.backgroundColorSecondary,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: context.appTheme.backgroundColorSecondary,
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: defaultTextStyle(context),
      bodyMedium: defaultTextStyle(context),
      bodySmall: defaultTextStyle(context),
      displayLarge: defaultTextStyle(context),
      displayMedium: defaultTextStyle(context),
      displaySmall: defaultTextStyle(context),
      headlineLarge: defaultTextStyle(context),
      headlineMedium: defaultTextStyle(context),
      headlineSmall: defaultTextStyle(context),
      labelLarge: defaultTextStyle(context),
      labelMedium: defaultTextStyle(context),
      labelSmall: defaultTextStyle(context),
      titleLarge: defaultTextStyle(context),
      titleMedium: defaultTextStyle(context),
      titleSmall: defaultTextStyle(context),
    ),
  );
  static TextStyle defaultTextStyle(BuildContext context) =>
      TextStyle(
        color: context.appTheme.textColorPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.2,
      );
}
