import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../models/genre.dart';


class GenresCubit extends Cubit<List<Genre>> {
  GenresCubit() : super([]);

  final String apiKey = "492e4145e722fe2ef92ed803fbfc82cd";
  final String baseUrl = "https://api.themoviedb.org/3";

  void fetchGenres() async {
    try {
      final response = await Dio().get("$baseUrl/genre/movie/list", queryParameters: {
        "api_key": apiKey,
      });

      final List<dynamic> genresJson = response.data['genres'];
      final genres = genresJson.map((json) => Genre.fromJson(json)).toList();

      emit(genres);
    } catch (e) {
      print("Error fetching genres: $e");
    }
  }
}