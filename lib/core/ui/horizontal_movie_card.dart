import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/core/extensions/widget_extension.dart';
import 'package:insort_assignment/domain/models/movie_model.dart';

class HorizontalMovieCard extends StatelessWidget {
  final MovieModel movie;
  final Function(MovieModel) onTap;
  const HorizontalMovieCard({
    super.key, required this.movie, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(movie);
      },
      child: Card(
        color: context.appTheme
            .backgroundColorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(
            12,),),
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius
                      .circular(12),
                  child:
                  CachedNetworkImage(
                    imageUrl: AppConfig()
                        .appEnv
                        .imageBaseUrlLite +
                        (movie
                            .posterPath ??
                            movie
                                .backdropPath ??
                            ""),
                    fit: BoxFit.cover,
                    height:
                    double.infinity,
                    width: 120,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                    const EdgeInsets
                        .symmetric(
                      horizontal:
                      10,
                      vertical: 10,),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Text(
                          movie
                              .title ??
                              "",
                          maxLines: 2,
                          style: Theme.of(
                            context,)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                            fontSize:
                            16,
                            fontWeight:
                            FontWeight
                                .w500,
                            color: context
                                .appTheme
                                .textColorPrimary,),
                        ),
                        5.hGap,
                        Row(
                          children: [
                            Text(
                              "Released On: ",
                              style: Theme.of(
                                context,)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                fontSize:
                                14,
                                fontWeight:
                                FontWeight.w400,
                                color: context.appTheme.textColorSecondary,),
                            ),
                            Text(
                              movie
                                  .releaseDate ??
                                  "NA",
                              style: Theme.of(
                                context,)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                fontSize:
                                14,
                                fontWeight:
                                FontWeight.w600,
                                color: context.appTheme.textColorPrimary,),
                            ),
                          ],
                        ),
                        2.hGap,
                        Row(
                          children: [
                            Text(
                              "Rating: ",
                              style: Theme.of(
                                context,)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                fontSize:
                                14,
                                fontWeight:
                                FontWeight.w400,
                                color: context.appTheme.textColorSecondary,),
                            ),
                            Text(
                              "${movie.voteAverage?.toStringAsFixed(1) ?? "NA"}/10 (${movie.voteCount ?? 0})",
                              style: Theme.of(
                                context,)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                fontSize:
                                14,
                                fontWeight:
                                FontWeight.w600,
                                color: context.appTheme.textColorPrimary,),
                            ),
                          ],
                        ),
                        5.hGap,
                        Expanded(
                          child: Text(
                            movie
                                .overview ??
                                "",
                            style: Theme.of(
                              context,)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                              fontSize:
                              12,
                              fontWeight: FontWeight
                                  .w400,
                              color: context
                                  .appTheme
                                  .textColorSecondary,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if(context.appStatePrimary.moviesList.map((m) => m.id).contains(movie.id))
              Align(
                  alignment:Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.stars_rounded,color: context.appTheme.accentYellow,size: 20,),
                  )),
          ],
        ),),
    );
  }
}
