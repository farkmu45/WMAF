import 'package:json_annotation/json_annotation.dart';
import 'package:week_10_moviedb/model/result.dart';

part 'popular_movies.g.dart';

@JsonSerializable()
class PopularMovies {
  final int page;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final List<Result> results;

  PopularMovies(this.page, this.totalResults, this.totalPages, this.results);

  factory PopularMovies.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesToJson(this);
}
