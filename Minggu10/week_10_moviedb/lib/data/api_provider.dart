import 'dart:convert';

import 'package:http/http.dart';
import 'package:week_10_moviedb/model/popular_movies.dart';

class ApiProvider {
  String apiKey = 'c344fd0df5de1a4ea6b548abd778d79c';
  String baseUrl = 'https://api.themoviedb.org/3';

  var client = Client();
  Future<PopularMovies> getPopularMovies() async {
    var response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
