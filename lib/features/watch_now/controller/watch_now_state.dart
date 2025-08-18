// Project imports:

class WatchNowState {
  final bool isLoading;
  WatchNowState({
    required this.isLoading,
  });

  factory WatchNowState.initial() => WatchNowState(
    isLoading: false,
      );

  WatchNowState copyWith({
    bool? isLoading,
  }) {
    return WatchNowState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
