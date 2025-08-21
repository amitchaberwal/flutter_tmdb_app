// Flutter imports:
import 'package:easy_stars/easy_stars.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller_events.dart';
import 'package:insort_assignment/core/di/injector.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/core/extensions/widget_extension.dart';
import 'package:insort_assignment/core/ui/image_view.dart';
import 'package:insort_assignment/data/dto/movie_detail_dto.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_bloc.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_event.dart';
import 'package:insort_assignment/features/movie_detail/controller/movie_detail_state.dart';
import 'package:share_plus/share_plus.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments as Map?);
    return BlocProvider(
      create: (context) =>
          MovieDetailBloc(di(), di())..add(GetMovieDetails(args?["id"] ?? 0)),
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
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Movie Details",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            actions: [
              if(state.movie != null)
                ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                        onTap: (){
                          String url = "tmdb://movie-app/movie_details?id=${state.movie?.id}";
                          SharePlus.instance.share(
                              ShareParams(uri: Uri.parse(url)),
                          );
                        },
                        child: Icon(Icons.share,size: 25,color: context.appTheme.textColorPrimary,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                        onTap: (){
                          context.addAppEventPrimary(ToggleBookmark(state.movie!.toMovieModel()));
                        },
                        child: Icon(context.appStatePrimary.moviesList.map((m) => m.id).contains(state.movie?.id??0)?Icons.bookmark:Icons.bookmark_border_outlined,size: 30,color: context.appTheme.textColorPrimary,),),
                  ),
                ],

            ],
          ),
          body: state.isLoading
              ? Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
              : (state.movie == null) ?
          Center(
            child: Text(
              "Movie Details can't be loaded",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: context
                    .appTheme.accentRed,),
            ),
          )
              :Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if ((state.movie?.posterPath ?? "").isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: ImageView(
                              imageUrl: AppConfig().appEnv.imageBaseUrlFull +
                                  (state.movie?.posterPath ?? ""),
                              height: 400,
                              width: double.infinity,
                            ),
                          ),
                        10.hGap,
                        SizedBox(
                          height: 20,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Text(
                                  state.movie?.genres?[index].name ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: context
                                              .appTheme.textColorSecondary,),
                                );
                              },
                              separatorBuilder: (_, index) {
                                return Container(
                                    height: 5,
                                    width: 5,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            context.appTheme.textColorSecondary,),);
                              },
                              itemCount: state.movie?.genres?.length ?? 0,),
                        ),
                        5.hGap,
                        Text(
                          state.movie?.title ?? "",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500,),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            EasyStarsRating(
                              initialRating: (state.movie?.voteAverage ?? 0) / 2,
                              allowHalfRating: true,
                              readOnly: true,
                              spacing: 2,
                              filledColor: context.appTheme.accentYellow,
                            ),
                            Text(
                              "(${state.movie?.voteCount?.toString() ?? ""})",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: context.appTheme.textColorPrimary,),
                            ),
                          ],
                        ),
                        10.hGap,
                        Row(
                          children: [
                            ChipView(
                              text:
                                  state.movie?.releaseDate?.substring(0, 4) ?? "",
                            ),
                            5.wGap,
                            ChipView(
                              text: state.movie?.status ?? "",
                            ),
                            5.wGap,
                            ChipView(
                              text: "${state.movie?.runtime ?? 0} mins",
                            ),
                          ],
                        ),
                        20.hGap,
                        Text(
                          state.movie?.overview ?? "",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: context.appTheme.textColorSecondary,),
                        ),
                        10.hGap,
                      ],
                    ),
                  ),
              ),
        );
      },
    );
  }
}

class ChipView extends StatelessWidget {
  final String text;

  const ChipView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: context.appTheme.textColorSecondary),
          borderRadius: BorderRadius.circular(100),),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
