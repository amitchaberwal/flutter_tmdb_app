// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/config/theme_config.dart';
import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller.state.dart';
import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller_bloc.dart';
import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller_events.dart';


extension AppControllerExtension on BuildContext {

  PrimaryAppState get appStatePrimary {
    return read<PrimaryAppBloc>().state;
  }
  void addAppEventPrimary(PrimaryAppEvent event) {
    read<PrimaryAppBloc>().add(event);
  }

}

extension AppControllerUtils on BuildContext {

}

extension StaticAppTheme on BuildContext {
  AppTheme get appTheme {
    return read<PrimaryAppBloc>().state.appTheme;
  }
}
