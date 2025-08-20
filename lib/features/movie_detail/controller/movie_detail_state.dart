// Project imports:

import 'package:insort_assignment/data/dto/movie_detail_dto.dart';

class MovieDetailState {
  final bool isLoading;
  final MovieDetailDTO? movie;
  MovieDetailState({
    required this.isLoading,
    this.movie,
  });

  factory MovieDetailState.initial() => MovieDetailState(
    isLoading: false,

      );

  MovieDetailState copyWith({
    bool? isLoading,
    MovieDetailDTO? movie,
  }) {
    return MovieDetailState(
      isLoading: isLoading ?? this.isLoading,
      movie: movie ?? this.movie,
    );
  }
}
