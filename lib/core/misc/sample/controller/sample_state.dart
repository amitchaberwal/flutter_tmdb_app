// Project imports:

class SampleState {
  final bool isLoading;
  SampleState({
    required this.isLoading,
  });

  factory SampleState.initial() => SampleState(
    isLoading: false,
      );

  SampleState copyWith({
    bool? isLoading,
  }) {
    return SampleState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
