// Project imports:

class HomeState {
  final int selectedIndex;
  HomeState({
    required this.selectedIndex,
  });

  factory HomeState.initial() => HomeState(
    selectedIndex: 0,
  );

  HomeState copyWith({
    int? selectedIndex,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
