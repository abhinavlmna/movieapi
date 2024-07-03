import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviess/moviemodel.dart';

class MovieService {
  static const String apiUrl = 'https://freetestapi.com/api/v1/movies';

  static Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<Movie> movies =
            jsonResponse.map((model) => Movie.fromJson(model)).toList();
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies');
    }
  }
}
