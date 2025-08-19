// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/domain/usecase/search_movies.dart';
import 'package:insort_assignment/features/search/controller/search_event.dart';
import 'package:insort_assignment/features/search/controller/search_state.dart';

// Project imports:

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMoviesUseCase searchMoviesUseCase;
  SearchBloc(this.searchMoviesUseCase) : super(SearchState.initial()) {
    on<GetSearchResult>((event, emit) async {
      if (state.isLoading) {
        return;
      }
      if(event.query.isEmpty){
        emit(
          state.copyWith(moviesList: []),
        );
        return;
      }
      if (!event.loadMore) {
        emit(
          state.copyWith(isLoading: true),
        );
      }
      final moviesList = await searchMoviesUseCase.getMovies(event.query);
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
