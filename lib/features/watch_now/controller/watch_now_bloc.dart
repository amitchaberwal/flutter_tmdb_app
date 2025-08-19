// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/domain/usecase/get_movies.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_event.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_state.dart';

// Project imports:

class WatchNowBloc extends Bloc<WatchNowEvent, WatchNowState> {
  final GetMoviesUseCase getMovies;

  WatchNowBloc({required this.getMovies}) : super(WatchNowState.initial()) {
    on<GetTrending>((event, emit) async {
      if (state.isLoading) {
        return;
      }
      if (!event.loadMore) {
        emit(
          state.copyWith(isLoading: true),
        );
      }
      final moviesList = await getMovies.tendingMovies(event.page + 1);
      emit(
        state.copyWith(
          isLoading: false,
          moviesList: moviesList,
          currentPage: event.page + 1,
        ),
      );
    });

    on<GetNowPlaying>((event, emit) async {
      if (state.isLoading) {
        return;
      }
      if (!event.loadMore) {
        emit(
          state.copyWith(isLoading: true),
        );
      }
      final moviesList = await getMovies.nowPlayingMovies(event.page + 1);
      emit(
        state.copyWith(
          isLoading: false,
          moviesList: moviesList,
          currentPage: event.page + 1,
        ),
      );
    });
  }
}
