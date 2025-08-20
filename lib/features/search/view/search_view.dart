// Flutter imports:
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/config/route_config.dart';
import 'package:insort_assignment/core/di/injector.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/core/ui/horizontal_movie_card.dart';
import 'package:insort_assignment/domain/usecase/search_movies.dart';
import 'package:insort_assignment/features/search/controller/search_bloc.dart';
import 'package:insort_assignment/features/search/controller/search_event.dart';
import 'package:insort_assignment/features/search/controller/search_state.dart';

// Project imports:

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(di<SearchMoviesUseCase>()),
      child: const SearchUI(),
    );
  }
}

class SearchUI extends StatefulWidget {
  const SearchUI({super.key});

  @override
  State<SearchUI> createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    EasyDebounce.cancel('search-debouncer');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Search",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14),
                    decoration: InputDecoration(
                      labelText: "Search Movie",
                      labelStyle: Theme.of(context).textTheme.titleSmall,
                      suffixIcon: _searchController.text.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                _searchController.clear();
                                context
                                    .read<SearchBloc>()
                                    .add(GetSearchResult(query: ""));
                              },
                              child: Icon(Icons.clear,
                                  color: context.appTheme.textColorPrimary,),
                            )
                          : null,
                    ),
                    onChanged: (val) {
                      EasyDebounce.debounce(
                          'search-debouncer', Duration(milliseconds: 1000), () {
                        context
                            .read<SearchBloc>()
                            .add(GetSearchResult(query: val));
                      });
                    },
                    onTapOutside: (_) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                Expanded(
                  child: state.isLoading
                      ? Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : state.moviesList.isNotEmpty
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Search Results",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: state.moviesList.length,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 2,
                                        ),
                                        child: SizedBox(
                                          height: 170,
                                          width: double.infinity,
                                          child: HorizontalMovieCard(
                                            movie: state.moviesList[index],
                                            onTap: (movie) {
                                              Navigator.pushNamed(
                                                context,
                                                RouteNames.movieDetail,
                                                arguments: {
                                                  "id": movie.id,
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Center(
                              child: Text(
                                _searchController.text.isEmpty
                                    ? "Search for movies"
                                    : "No results found",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
