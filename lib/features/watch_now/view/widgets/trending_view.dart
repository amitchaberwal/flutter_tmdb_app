import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/features/watch_now/controller/watch_now_state.dart';

class TrendingView extends StatelessWidget {
  final WatchNowState state;
  const TrendingView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if(state.isLoading){
      return Center(
        child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),),
      );
    }
    else{
      return GridView.builder(
        itemCount: state.moviesList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: AppConfig().appEnv.imageBaseUrlLite + (state.moviesList[index].backdropPath??""),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    color: context.appTheme.appColorDark.withValues(alpha: 0.3),
                    colorBlendMode: BlendMode.srcATop,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Text(state.moviesList[index].title??"", maxLines: 2,style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w500,color: context.appTheme.appColorWhite),),
                    ),),
              ],
            ),
          );
        },
      );
    }
  }
}
