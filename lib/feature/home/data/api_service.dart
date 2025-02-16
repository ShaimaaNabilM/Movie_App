import 'dart:convert';

import '../models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';


class ApiService {
  static const String apiKey = "492e4145e722fe2ef92ed803fbfc82cd";
  static const String baseUrl = "https://api.themoviedb.org/3/movie/";

  Future<List<MovieModel>> getMoviesByCategory(String category) async {
    final url = Uri.parse("$baseUrl$category?api_key=$apiKey");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<MovieModel> movies = (data["results"] as List)
          .map((json) => MovieModel.fromJson(json))
          .toList();
      return movies;
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
