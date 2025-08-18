// Flutter imports:

import '../../config/theme_config.dart';

class PrimaryAppState {
  final AppTheme appTheme;

  PrimaryAppState({
    required this.appTheme,
  });

  factory PrimaryAppState.initial() => PrimaryAppState(
        appTheme: AppDarkTheme(),
      );

  PrimaryAppState copyWith({
    AppTheme? appTheme,
    ThemeKey? themeKey,
  }) {
    return PrimaryAppState(
      appTheme: appTheme ?? this.appTheme,
    );
  }
}
