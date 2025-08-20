// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/features/watch_now/view/widgets/movies_grid_view.dart';

// Project imports:

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchListUI();
  }
}

class WatchListUI extends StatelessWidget {
  const WatchListUI({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("WatchList", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20,fontWeight: FontWeight.w800),),
        ),
        body: context.appStatePrimary.moviesList.isEmpty?
        Center(child: Text("No Movies Saved", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20,fontWeight: FontWeight.w500),)):
        MoviesGridView(moviesList: context.appStatePrimary.moviesList,isLoading: false,),
    );
  }
}
