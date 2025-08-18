// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/misc/sample/controller/sample_event.dart';
import 'package:insort_assignment/core/misc/sample/controller/sample_state.dart';

// Project imports:

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc() : super(SampleState.initial()) {
    on<UpdateNavigationData>((event, emit) {
      emit(
        state.copyWith(
        ),
      );
    });
  }
}
