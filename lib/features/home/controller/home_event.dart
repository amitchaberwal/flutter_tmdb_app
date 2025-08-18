abstract class HomeEvent {
  const HomeEvent();
}

class InitializeHome extends HomeEvent {
  const InitializeHome();
}

class UpdateSelectedIndex extends HomeEvent {
  final int index;
  const UpdateSelectedIndex(
      this.index,
      );
}

class ConsumeDeepLink extends HomeEvent {
  final String deepLinkURL;
  final Map<String, dynamic>? args;
  final String? fallbackRoute;

  const ConsumeDeepLink({
    required this.deepLinkURL,
    this.args,
    this.fallbackRoute,
  });
}
