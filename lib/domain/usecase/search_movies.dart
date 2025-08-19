import 'package:insort_assignment/domain/models/movie_model.dart';
import 'package:insort_assignment/domain/repo/movie_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository repository;
  SearchMoviesUseCase(this.repository);

  Future<List<MovieModel>> getMovies(String query) {
    return repository.searchMovies(query);
  }
}
