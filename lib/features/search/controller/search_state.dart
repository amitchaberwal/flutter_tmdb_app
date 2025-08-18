// Project imports:

class SearchState {
  final bool isLoading;
  SearchState({
    required this.isLoading,
  });

  factory SearchState.initial() => SearchState(
    isLoading: false,
      );

  SearchState copyWith({
    bool? isLoading,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
