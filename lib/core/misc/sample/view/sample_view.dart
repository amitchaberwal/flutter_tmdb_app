// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/misc/sample/controller/sample_bloc.dart';
import 'package:insort_assignment/core/misc/sample/controller/sample_state.dart';

// Project imports:

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: const SampleUI(),
    );
  }
}

class SampleUI extends StatelessWidget {
  const SampleUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SampleBloc, SampleState>(
      builder: (context, state) {
        return const Scaffold();
      },
    );
  }
}
