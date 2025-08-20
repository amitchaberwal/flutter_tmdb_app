
abstract class MovieDetailEvent {
  const MovieDetailEvent();
}

class GetMovieDetails extends MovieDetailEvent{
  final int id;
  const GetMovieDetails(this.id);
}
