// Project imports:
import 'package:insort_assignment/app/app.dart';
import 'package:insort_assignment/core/config/env_config.dart';

void main() {
  EnvConfig appEnv = DevEnvironment();
  initializeMainApp(appEnv);
}
