// Project imports:

class MovieDetailState {
  final bool isLoading;
  MovieDetailState({
    required this.isLoading,
  });

  factory MovieDetailState.initial() => MovieDetailState(
    isLoading: false,
      );

  MovieDetailState copyWith({
    bool? isLoading,
  }) {
    return MovieDetailState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
