import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  final double popularity;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final bool video;
  @JsonKey(name: 'poster_path')
  final String posterPath;
  final int id;
  final bool adult;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  final String title;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;

  Result(
      this.popularity,
      this.voteCount,
      this.video,
      this.posterPath,
      this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.title,
      this.voteAverage,
      this.overview,
      this.releaseDate);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
