import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "original_title")
  final String? originalTitle;
  @JsonKey(name: "overview")
  final String? overview;
  @JsonKey(name: "popularity")
  final double? popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name: "vote_count")
  final int? voteCount;

  MovieModel ({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieModelToJson(this);
  }
}
