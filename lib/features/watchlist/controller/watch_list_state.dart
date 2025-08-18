// Project imports:

class WatchListState {
  final bool isLoading;
  WatchListState({
    required this.isLoading,
  });

  factory WatchListState.initial() => WatchListState(
    isLoading: false,
      );

  WatchListState copyWith({
    bool? isLoading,
  }) {
    return WatchListState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
