// Flutter imports:
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:insort_assignment/core/config/env_config.dart';
import 'package:insort_assignment/core/config/route_config.dart';
import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller.state.dart';
import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller_bloc.dart';
import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller_events.dart';
import 'package:insort_assignment/core/di/injector.dart';
import 'package:insort_assignment/core/helpers/app_completers.dart';
import 'package:insort_assignment/core/services/connectivity_services.dart';
import 'package:insort_assignment/core/services/deeplink_service.dart';

// Project imports:

final appNavigatorKey = GlobalKey<NavigatorState>();

Future initializeMainApp(EnvConfig envConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig().appEnv = envConfig;
  AppCompleter.initialize();

  initializeDependencies();

  final mainApp = MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
            PrimaryAppBloc()..add(GetInitialConfiguration(context)),
      ),
    ],
    child: const MainApp(),
  );

  return runApp(mainApp);
}

Future<void> initializeDependencies() async {
  //Initialize Dependencies
  initDependencies();
  ConnectivityService().initializeConnectivityStream();
  DeepLinkServices().initialize();
  AppCompleter.appInitCompleter.complete(true);
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    AppConfig().rootContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrimaryAppBloc, PrimaryAppState>(
      builder: (context, state) {
        return MaterialApp(
          navigatorKey: appNavigatorKey,
          supportedLocales: const [Locale("en", "IN")],
          debugShowCheckedModeBanner: false,
          title: AppConfig().appEnv.appTitle,
          // themeMode: ThemeMode.dark,
          initialRoute: "/",
          routes: appRoutes,
        );
      },
    );
  }
}
