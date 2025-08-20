// ignore_for_file: public_member_api_docs, sort_constructors_first

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:insort_assignment/core/config/theme_config.dart';
import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller.state.dart';
import 'package:insort_assignment/domain/models/movie_model.dart';

abstract class PrimaryAppEvent {
  const PrimaryAppEvent();
}

class GetInitialConfiguration extends PrimaryAppEvent {
  final BuildContext context;

  const GetInitialConfiguration(this.context);
}

class UpdateState extends PrimaryAppEvent {
  final PrimaryAppState state;

  const UpdateState(this.state);
}

class UpdateAppTheme extends PrimaryAppEvent {
  final AppTheme theme;
  const UpdateAppTheme({required this.theme});
}

class GetSavedMovies extends PrimaryAppEvent{
  const GetSavedMovies();
}
class ToggleBookmark extends PrimaryAppEvent{
  final MovieModel movie;
  const ToggleBookmark(this.movie);
}
