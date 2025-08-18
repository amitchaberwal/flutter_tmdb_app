// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/search/controller/search_event.dart';
import 'package:insort_assignment/features/search/controller/search_state.dart';

// Project imports:

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial()) {
    on<UpdateNavigationData>((event, emit) {
      emit(
        state.copyWith(
        ),
      );
    });
  }
}
