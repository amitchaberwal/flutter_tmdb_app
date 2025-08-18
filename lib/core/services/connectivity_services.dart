// Dart imports:
import 'dart:async';

// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._();
  factory ConnectivityService() => _instance;
  ConnectivityService._();

  final _connectivity = Connectivity();
  bool isConnected = true;

  initializeConnectivityStream() {
    _connectivity.onConnectivityChanged.listen((result) {
      isConnected = _parseConnectivityResult(result);
    });
  }

  Future<bool> get checkConnectivity async {
    final result = await _connectivity.checkConnectivity();

    return _parseConnectivityResult(result);
  }

  bool _parseConnectivityResult(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (result.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }
}
