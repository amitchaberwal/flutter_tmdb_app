// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:insort_assignment/core/di/injector.dart';
import 'package:insort_assignment/domain/repo/movie_repository.dart';
import 'package:insort_assignment/features/home/controller/home_event.dart';
import 'package:insort_assignment/features/home/controller/home_state.dart';
import 'package:insort_assignment/features/home/model/bottom_bar_item.dart';
import 'package:insort_assignment/features/search/view/search_view.dart';
import 'package:insort_assignment/features/watch_now/view/watch_now_view.dart';
import 'package:insort_assignment/features/watchlist/view/watch_list_view.dart';

// Project imports:

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<Widget> homeTiles = [
    const WatchNow(),
    const Search(),
    const WatchList(),
  ];
  List<BottomBarItemModel> bottomBarItems = [
    const BottomBarItemModel(
      name: "Watch",
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    const BottomBarItemModel(
      name: "Search",
      icon: Icons.search,
      activeIcon: Icons.search_rounded,
    ),
    const BottomBarItemModel(
      name: "Bookmarks",
      icon: Icons.bookmark_border_rounded,
      activeIcon: Icons.bookmark,
    ),
  ];
  HomeBloc() : super(HomeState.initial()) {
    on<UpdateSelectedIndex>((event, emit) {
      emit(
        state.copyWith(
          selectedIndex: event.index,
        ),
      );
    });

    on<InitializeHome>((event, emit) async {
      final movieRepo = di<MovieRepository>();
      movieRepo.getNowPlayingMovies(1);
      movieRepo.getTrendingMovies(1);
      movieRepo.getMovieDetail(3);
    });

    on<ConsumeDeepLink>((event, emit) {
      Navigator.pushNamed(
        AppConfig().homeContext!,
        event.deepLinkURL,
        arguments: event.args,
      );
    });
  }
}
