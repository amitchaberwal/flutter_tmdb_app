import 'package:flutter/material.dart';
import 'package:insort_assignment/core/config/route_config.dart';
import 'package:insort_assignment/core/ui/movie_card_view.dart';
import 'package:insort_assignment/domain/models/movie_model.dart';

class MoviesGridView extends StatelessWidget {
  final bool isLoading;
  final List<MovieModel> moviesList;
  const MoviesGridView({super.key, required this.isLoading, required this.moviesList});

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return Center(
        child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),),
      );
    }
    else{
      if(moviesList.isEmpty){
        return Center(child: Text("Movies not available", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20,fontWeight: FontWeight.w500),));
      }
      else{
        return GridView.builder(
          itemCount: moviesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return MovieCardView(
              onTap: (movie){
                Navigator.pushNamed(
                  context,
                  RouteNames.movieDetail,
                  arguments: {
                    "id": movie.id,
                  },
                );
              },
              movie: moviesList[index],);
          },
        );
      }
    }
  }
}
