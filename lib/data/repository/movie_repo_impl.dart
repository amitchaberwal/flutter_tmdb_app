import 'package:insort_assignment/app/app.dart';
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/core/extensions/utils_extensions.dart';
import 'package:insort_assignment/data/dto/movie_detail_dto.dart';
import 'package:insort_assignment/data/local/movie_dao.dart';
import 'package:insort_assignment/data/remote/tmdb_remote_repo.dart';
import 'package:insort_assignment/domain/models/movie_model.dart';
import 'package:insort_assignment/domain/repo/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final TMDBRemoteRepo remote;
  final MovieDao local;

  MovieRepositoryImpl(this.remote, this.local);

  @override
  Future<List<MovieModel>> getTrendingMovies(int page) async {
    try{
      final movies = (await remote.trending(page: page)).results;
      await local.saveMovies("trending",movies);
      return movies;
    }catch(e){
      (appNavigatorKey.currentContext??AppConfig().rootContext).showSnackBar(text: "Something went wrong", color:AppConfig().rootContext.appTheme.accentRed );
      return await local.getSavedMovies("trending");
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies(int page) async{
    try{
      final movies = (await remote.nowPlaying(page: page)).results;
      await local.saveMovies("playing",movies);
      return movies;
    }catch(e){
      (appNavigatorKey.currentContext??AppConfig().rootContext).showSnackBar(text: "Something went wrong", color:AppConfig().rootContext.appTheme.accentRed );
      return await local.getSavedMovies("playing");
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    return (await remote.search(query)).results;
  }

  @override
  Future<MovieDetailDTO?> getMovieDetail(int id) async {
    try{
      final movie = await remote.movieDetail(id);
      await local.toggleBookmark(MovieModel.fromJson(movie.toJson()));
      return movie;
    }
    catch(e){
      (appNavigatorKey.currentContext??AppConfig().rootContext).showSnackBar(text: "Something went wrong", color:AppConfig().rootContext.appTheme.accentRed );
      return null;
    }
  }

  @override
  Future<void> toggleBookmark(MovieModel movie) async {
    await local.toggleBookmark(movie);
  }

  @override
  Future<List<MovieModel>> getBookmarks() async {
    return await local.getBookmarks();
  }

}
