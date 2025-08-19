import 'package:insort_assignment/domain/models/movie_model.dart';
import 'package:insort_assignment/domain/repo/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;
  GetMoviesUseCase(this.repository);

  Future<List<MovieModel>> tendingMovies(int page) {
    return repository.getTrendingMovies(page);
  }
  Future<List<MovieModel>> nowPlayingMovies(int page) {
    return repository.getNowPlayingMovies(page);
  }
}
