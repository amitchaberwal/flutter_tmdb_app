import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:insort_assignment/core/services/api_client.dart';
import 'package:insort_assignment/core/services/database/app_database.dart';
import 'package:insort_assignment/core/services/database/hive_db.dart';
import 'package:insort_assignment/data/local/movie_dao.dart';
import 'package:insort_assignment/data/remote/tmdb_remote_repo.dart';
import 'package:insort_assignment/data/repository/movie_repo_impl.dart';
import 'package:insort_assignment/domain/repo/movie_repository.dart';
import 'package:insort_assignment/domain/usecase/get_movie_details.dart';
import 'package:insort_assignment/domain/usecase/get_movies.dart';
import 'package:insort_assignment/domain/usecase/search_movies.dart';


final di = GetIt.instance;

Future<void> initDependencies() async {

  di.registerLazySingleton<AppDatabase>(() => HiveDatabase());
  di<AppDatabase>().init();

  di.registerLazySingleton<Dio>(() => NetworkClient().createDio());

  di.registerLazySingleton<TMDBRemoteRepo>(() => TMDBRemoteRepo(di<Dio>()));
  di.registerLazySingleton<MovieDao>(() => MovieDao(database: di<AppDatabase>()));

  di.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(di(),di()));

  di.registerLazySingleton<GetMoviesUseCase>(() => GetMoviesUseCase(di<MovieRepository>()));
  di.registerLazySingleton<GetMovieDetailUseCase>(() => GetMovieDetailUseCase(di<MovieRepository>()));
  di.registerLazySingleton<SearchMoviesUseCase>(() => SearchMoviesUseCase(di<MovieRepository>()));

}
