// Dart imports:
import 'dart:async';

class AppCompleter {
  static late Completer appInitCompleter;
  static late Completer hiveInitCompleter;

  static void initialize() {
    appInitCompleter = Completer();
    hiveInitCompleter = Completer();
  }
}
