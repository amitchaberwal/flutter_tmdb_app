// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_bloc.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_state.dart';

// Project imports:

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc(),
      child: const MovieDetailUI(),
    );
  }
}

class MovieDetailUI extends StatelessWidget {
  const MovieDetailUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return const Scaffold();
      },
    );
  }
}
