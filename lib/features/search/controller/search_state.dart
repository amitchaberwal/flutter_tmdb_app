// Project imports:

import 'package:insort_assignment/domain/models/movie_model.dart';

class SearchState {
  final bool isLoading;
  final List<MovieModel> moviesList;
  final int currentPage;
  SearchState({
    required this.isLoading,
    this.moviesList = const [],
    this.currentPage = 1,
  });

  factory SearchState.initial() => SearchState(
    isLoading: false,
      );

  SearchState copyWith({
    bool? isLoading,
    List<MovieModel>? moviesList,
    int? currentPage,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      moviesList: moviesList ?? this.moviesList,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
