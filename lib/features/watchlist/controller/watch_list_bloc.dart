// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/watchlist/controller/watch_list_event.dart';
import 'package:insort_assignment/features/watchlist/controller/watch_list_state.dart';

// Project imports:

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  WatchListBloc() : super(WatchListState.initial()) {
    on<UpdateNavigationData>((event, emit) {
      emit(
        state.copyWith(
        ),
      );
    });
  }
}
