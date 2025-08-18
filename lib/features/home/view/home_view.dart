// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/home/controller/home_bloc.dart';
import 'package:insort_assignment/features/home/controller/home_event.dart';
import 'package:insort_assignment/features/home/controller/home_state.dart';

// Project imports:

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(InitializeHome()),
      child: const HomeUI(),
    );
  }
}

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return const Scaffold(
          backgroundColor: Colors.black,
        );
      },
    );
  }
}
