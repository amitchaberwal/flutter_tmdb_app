import 'package:insort_assignment/data/dto/movie_detail_dto.dart';
import 'package:insort_assignment/domain/models/movie_model.dart';

abstract class MovieRepository{
  Future<List<MovieModel>> getTrendingMovies(int page);
  Future<List<MovieModel>> getNowPlayingMovies(int page);
  Future<List<MovieModel>> searchMovies(String query);
  Future<MovieDetailDTO> getMovieDetail(int id);
  Future<void> toggleBookmark(MovieModel movie);
  Future<List<MovieModel>> getBookmarks();
}
