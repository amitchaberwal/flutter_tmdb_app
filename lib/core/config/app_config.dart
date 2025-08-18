// Flutter imports:
import 'package:flutter/material.dart';

import 'package:insort_assignment/core/config/env_config.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._();
  factory AppConfig() => _instance;
  AppConfig._();

  late BuildContext rootContext;
  BuildContext? homeContext;
  EnvConfig appEnv = DevEnvironment();
}
