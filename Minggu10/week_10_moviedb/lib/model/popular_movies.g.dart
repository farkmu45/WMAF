// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovies _$PopularMoviesFromJson(Map<String, dynamic> json) =>
    PopularMovies(
      json['page'] as int,
      json['total_results'] as int,
      json['total_pages'] as int,
      (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularMoviesToJson(PopularMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };
