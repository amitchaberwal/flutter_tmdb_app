// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  void get print {
    if (kDebugMode) {
      final timeDate = DateTime.now();
      log("Log($timeDate):$this");
    }
  }
}

extension ContextExtensions on BuildContext {
  String get currentRoute {
    return ModalRoute.of(this)?.settings.name ?? "";
  }

  void pop({dynamic result}) {
    Navigator.of(this).pop(result);
  }
}
