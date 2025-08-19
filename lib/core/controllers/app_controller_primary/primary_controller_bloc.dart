// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/config/theme_config.dart';

import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller.state.dart';
import 'primary_controller_events.dart';

class PrimaryAppBloc extends Bloc<PrimaryAppEvent, PrimaryAppState> {
  bool isDeviceTypeChanging = false;
  PrimaryAppBloc() : super(PrimaryAppState.initial()) {
    on<UpdateAppTheme>((event, emit) async {
      add(UpdateState(state.copyWith(appTheme: event.theme)));
    });
    on<UpdateState>((event, emit) async {
      emit(
        event.state,
      );
    });

    on<GetInitialConfiguration>((event, emit) async {
      AppTheme appTheme = AppDarkTheme();
      add(UpdateAppTheme(theme: appTheme));
    });
  }
}
