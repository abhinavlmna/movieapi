import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:moviess/moviemodel.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  final TextEditingController searchController = TextEditingController();

  MovieProvider() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    final response =
        await http.get(Uri.parse("https://freetestapi.com/api/v1/movies"));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _movies = data.map((json) => Movie.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<void> searchMovies(String query) async {
    final response = await http
        .get(Uri.parse("https://freetestapi.com/api/v1/movies?search=$query"));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _movies = data.map((json) => Movie.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to search movies');
    }
  }

  void clearSearch() {
    searchController.clear();
    fetchMovies();
  }
}
