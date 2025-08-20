// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/domain/usecase/bookmarks_usecase.dart';
import 'package:insort_assignment/domain/usecase/get_movie_details.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_event.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_state.dart';

// Project imports:

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase getMovieDetail;
  final BookmarkUseCase bookmarkUseCase;
  MovieDetailBloc(this.getMovieDetail, this.bookmarkUseCase) : super(MovieDetailState.initial()) {

    on<GetMovieDetails>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
        ),
      );
      final movie = await getMovieDetail.getDetail(event.id);
      emit(
        state.copyWith(
          isLoading: false,
          movie: movie,
        ),
      );
    });
  }
}
