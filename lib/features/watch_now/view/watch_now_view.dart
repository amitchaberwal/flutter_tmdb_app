// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_bloc.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_state.dart';

// Project imports:

class WatchNow extends StatelessWidget {
  const WatchNow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchNowBloc(),
      child: const WatchNowUI(),
    );
  }
}

class WatchNowUI extends StatelessWidget {
  const WatchNowUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchNowBloc, WatchNowState>(
      builder: (context, state) {
        return const Scaffold();
      },
    );
  }
}
