// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/di/injector.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/core/extensions/utils_extensions.dart';
import 'package:insort_assignment/domain/usecase/get_movies.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_bloc.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_event.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_state.dart';
import 'package:insort_assignment/features/watch_now/view/widgets/movies_grid_view.dart';

// Project imports:

class WatchNow extends StatelessWidget {
  const WatchNow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchNowBloc(getMovies: di<GetMoviesUseCase>())..add(GetTrending()),
      child: const WatchNowUI(),
    );
  }
}

class WatchNowUI extends StatefulWidget {
  const WatchNowUI({super.key});

  @override
  State<WatchNowUI> createState() => _WatchNowUIState();
}

class _WatchNowUIState extends State<WatchNowUI> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if(tabController.index == 0){
        context.read<WatchNowBloc>().add(GetTrending());
      }
      else if(tabController.index == 1){
        context.read<WatchNowBloc>().add(GetNowPlaying());
      }
      tabController.index.toString().print;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchNowBloc, WatchNowState>(
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            title: Text("Watch", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20,fontWeight: FontWeight.w800),),
          ),
          body: Column(
            children: [
            TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                text: "Trending",
              ),
              Tab(
                text: "Now Playing",
              ),
            ],
            unselectedLabelStyle:
            Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: context.appTheme.textColorPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            labelStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(
              color: context.appTheme.backgroundColorPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 0,
            indicator: BoxDecoration(
              color: context.appTheme.accentColor,
              borderRadius: BorderRadius.circular(100),
            ),),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      MoviesGridView(isLoading: state.isLoading,moviesList: state.moviesList,),
                      MoviesGridView(isLoading: state.isLoading,moviesList: state.moviesList,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
