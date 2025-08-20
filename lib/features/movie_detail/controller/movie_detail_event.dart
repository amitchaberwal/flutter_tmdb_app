import 'package:insort_assignment/domain/models/movie_model.dart';

abstract class MovieDetailEvent {
  const MovieDetailEvent();
}

class GetMovieDetails extends MovieDetailEvent{
  final int id;
  const GetMovieDetails(this.id);
}

