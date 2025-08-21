// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';

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

  void showSnackBar({required String text, Color? color}) {
    ScaffoldMessenger.of(this)
        .showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(
          text,
          style: Theme.of(this)
              .textTheme
              .titleLarge
              ?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: appTheme.textColorPrimary,),
        ),
      ),
    );
  }

  void pop({dynamic result}) {
    Navigator.of(this).pop(result);
  }
}
