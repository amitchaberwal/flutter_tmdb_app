import 'package:dio/dio.dart';
import 'package:insort_assignment/data/dto/movie_detail_dto.dart';
import 'package:insort_assignment/data/dto/movie_response.dart';
import 'package:retrofit/retrofit.dart';
part 'tmdb_remote_repo.g.dart';

@RestApi()
abstract class TMDBRemoteRepo {
  factory TMDBRemoteRepo(Dio dio, {String baseUrl}) = _TMDBRemoteRepo;

  @GET('/trending/movie/week')
  Future<MovieResponse> trending({@Query('page') int page = 1});

  @GET('/movie/now_playing')
  Future<MovieResponse> nowPlaying({@Query('page') int page = 1});

  @GET('/movie/{id}')
  Future<MovieDetailDTO> movieDetail(@Path('id') int id);

  @GET('/search/movie')
  Future<MovieResponse> search(@Query('query') String query, {@Query('page') int page = 1});
}
