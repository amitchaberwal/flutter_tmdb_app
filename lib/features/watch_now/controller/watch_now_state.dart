// Project imports:

import 'package:insort_assignment/domain/models/movie_model.dart';

class WatchNowState {
  final bool isLoading;
  final List<MovieModel> moviesList;
  final int currentPage;
  WatchNowState({
    required this.isLoading,
    this.moviesList = const [],
    this.currentPage = 1,
  });

  factory WatchNowState.initial() => WatchNowState(
    isLoading: false,
      );

  WatchNowState copyWith({
    bool? isLoading,
    List<MovieModel>? moviesList,
    int? currentPage,
  }) {
    return WatchNowState(
      isLoading: isLoading ?? this.isLoading,
      moviesList: moviesList ?? this.moviesList,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
