import 'package:insort_assignment/domain/models/movie_model.dart';
import 'package:insort_assignment/domain/repo/movie_repository.dart';

class BookmarkUseCase{
  final MovieRepository repository;

  BookmarkUseCase(this.repository);

  Future<void> toggleBookmark(MovieModel movie) async{
    await repository.toggleBookmark(movie);
  }
  Future<List<MovieModel>> getSavedMovies()async{
    return repository.getBookmarks();
  }
}
