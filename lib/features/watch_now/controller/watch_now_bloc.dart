// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_event.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_state.dart';

// Project imports:

class WatchNowBloc extends Bloc<WatchNowEvent, WatchNowState> {
  WatchNowBloc() : super(WatchNowState.initial()) {
    on<UpdateNavigationData>((event, emit) {
      emit(
        state.copyWith(
        ),
      );
    });
  }
}
