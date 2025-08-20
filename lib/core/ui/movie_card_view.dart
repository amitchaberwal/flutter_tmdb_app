import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/domain/models/movie_model.dart';

class MovieCardView extends StatelessWidget {
  final MovieModel movie;
  final Function(MovieModel) onTap;
  const MovieCardView({
    super.key, required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(movie);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: AppConfig().appEnv.imageBaseUrlLite + (movie.backdropPath??""),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  color: context.appTheme.appColorDark.withValues(alpha: 0.7),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Text(movie.title??"", maxLines: 2,style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w500,color: context.appTheme.appColorWhite),),
                  ),
                ),),
              if(context.appStatePrimary.moviesList.map((m) => m.id).contains(movie.id))
              Align(
                  alignment:Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.stars_rounded,color: context.appTheme.accentYellow,size: 20,),
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
