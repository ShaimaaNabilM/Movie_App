import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../model/moves.dart';

class MoviesCubit extends Cubit<List<Movie>> {
  MoviesCubit() : super([]);

  final String apiKey = "492e4145e722fe2ef92ed803fbfc82cd";
  final String baseUrl = "https://api.themoviedb.org/3";

  void fetchMoviesByGenre(int genreId) async {
    try {
      final response = await Dio().get("$baseUrl/discover/movie", queryParameters: {
        "api_key": apiKey,
        "with_genres": genreId.toString(),
      });

      final List<dynamic> moviesJson = response.data['results'];
      final movies = moviesJson.map((json) => Movie.fromJson(json)).toList();

      emit(movies);
    } catch (e) {
      print("Error fetching movies: $e");
    }
  }
}
