// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/features/search/controller/search_bloc.dart';
import 'package:insort_assignment/features/search/controller/search_state.dart';

// Project imports:

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(),
      child: const SearchUI(),
    );
  }
}

class SearchUI extends StatelessWidget {
  const SearchUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            title: Text("Search", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20,fontWeight: FontWeight.w800),),
          ),
        );
      },
    );
  }
}
