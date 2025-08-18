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
    final movies = (await remote.trending());
    await local.saveMovies(movies.results);
    return movies.results;
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    return (await remote.search(query)).results;
  }

  @override
  Future<MovieDetailDTO> getMovieDetail(int id) async {
    return await remote.movieDetail(id);
  }

  @override
  Future<void> toggleBookmark(MovieModel movie) async {
    await local.toggleBookmark(movie);
  }

  @override
  Future<List<MovieModel>> getBookmarks() async {
    return await local.getBookmarks();
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies(int page) async{
    final movies = (await remote.nowPlaying(page: page));
    await local.saveMovies(movies.results);
    return movies.results;
  }
}
