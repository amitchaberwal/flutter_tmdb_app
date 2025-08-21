
import 'package:insort_assignment/core/constants/hive_key_constants.dart';
import 'package:insort_assignment/core/services/database/app_database.dart';
import 'package:insort_assignment/domain/models/movie_model.dart';

class MovieDao {
  final AppDatabase database;
  const MovieDao({
    required this.database,
  });

  Future<void> saveMovies(String movieType,List<MovieModel> movies,) async {
    Map<String, dynamic> savedMovies = (await database.readData(dbName: HiveBoxConstants.moviesBox,key: movieType,defaultValue: {}));
    for (var movie in movies) {
      savedMovies[movie.id.toString()] = movie.toJson();
    }
    await database.writeData(dbName: HiveBoxConstants.moviesBox, key: movieType, data: savedMovies);
  }

  Future<List<MovieModel>> getSavedMovies(String movieType,) async {
    Map<String, dynamic> savedMovies = (await database.readData(dbName: HiveBoxConstants.moviesBox,key: movieType,defaultValue: {}));
    return savedMovies.values.toList().map((e)=> MovieModel.fromJson(e)).toList();
  }

  Future<void> toggleBookmark(MovieModel movie) async {
    final userBox = await database.getDB(dbName: HiveBoxConstants.userBox);
    if (userBox.keys.contains(movie.id.toString())) {
      userBox.delete(movie.id.toString());
    } else {
      userBox.put(movie.id.toString(), movie.toJson());
    }
  }

  Future<List<MovieModel>> getBookmarks() async {
    return (await database.getDB(dbName: HiveBoxConstants.userBox)).values.toList().map((e)=> MovieModel.fromJson((e).cast<String, dynamic>())).toList();
  }
}
