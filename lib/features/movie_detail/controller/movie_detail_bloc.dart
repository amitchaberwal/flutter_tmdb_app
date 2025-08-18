// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_event.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_state.dart';

// Project imports:

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailState.initial()) {
    on<UpdateNavigationData>((event, emit) {
      emit(
        state.copyWith(
        ),
      );
    });
  }
}
