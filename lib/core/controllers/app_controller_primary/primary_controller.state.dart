// Flutter imports:

import 'package:insort_assignment/domain/models/movie_model.dart';

import '../../config/theme_config.dart';

class PrimaryAppState {
  final AppTheme appTheme;
  final List<MovieModel> moviesList;

  PrimaryAppState({
    required this.appTheme,
    this.moviesList = const [],
  });

  factory PrimaryAppState.initial() => PrimaryAppState(
        appTheme: AppDarkTheme(),
      );

  PrimaryAppState copyWith({
    AppTheme? appTheme,
    ThemeKey? themeKey,
    List<MovieModel>? moviesList,
  }) {
    return PrimaryAppState(
      appTheme: appTheme ?? this.appTheme,
      moviesList: moviesList ?? this.moviesList,
    );
  }
}
