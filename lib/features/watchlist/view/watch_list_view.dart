// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/watchlist/controller/watch_list_bloc.dart';
import 'package:insort_assignment/features/watchlist/controller/watch_list_state.dart';

// Project imports:

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchListBloc(),
      child: const WatchListUI(),
    );
  }
}

class WatchListUI extends StatelessWidget {
  const WatchListUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            title: Text("WatchList", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20,fontWeight: FontWeight.w800),),
          ),
        );
      },
    );
  }
}
