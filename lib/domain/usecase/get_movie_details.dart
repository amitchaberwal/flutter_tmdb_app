import 'package:insort_assignment/data/dto/movie_detail_dto.dart';
import 'package:insort_assignment/domain/repo/movie_repository.dart';

class GetMovieDetailUseCase {
  final MovieRepository repository;
  GetMovieDetailUseCase(this.repository);

  Future<MovieDetailDTO?> getDetail(int id) {
    return repository.getMovieDetail(id);
  }
}
