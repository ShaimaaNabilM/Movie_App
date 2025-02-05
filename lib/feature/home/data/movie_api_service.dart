import 'package:dio/dio.dart';
import 'package:movie_app/feature/home/data/models/casts_model.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';

class MovieService {
  final String apikey = "492e4145e722fe2ef92ed803fbfc82cd";
  final Dio dio = Dio();

  // Singleton instance
  static final MovieService _instance = MovieService._internal();

  factory MovieService() {
    return _instance;
  }

  MovieService._internal();

  // Future<List<MovieApi>> getUpcomingMovies() async {
  //   final response = await dio
  //       .get('https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey');
  //   return (response.data['results'] as List)
  //       .map((movie) => MovieApi.fromJson(movie))
  //       .toList();
  // }

  Future<MovieApi> getMovieDetails(int id) async {
    final response =
        await dio.get('https://api.themoviedb.org/3/movie/$id?api_key=$apikey');
    return MovieApi.fromJson(response.data);
  }

  Future<String?> getMovieVideoKey(int id) async {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apikey&language=en-US',
    );

    if (response.data['results'] != null &&
        response.data['results'].isNotEmpty) {
      return response.data['results'][0]['key'];
    }
    return null;
  }

  // casts
  Future<List<MovieApi>> getCastsInfo(int id) async {
  try {
    final response = await dio.get(
      'https://api.themoviedb.org/3/movie/$id/credits?api_key=$apikey',
    );

    if (response.statusCode == 200 && response.data['cast'] != null) {
      return (response.data['cast'] as List)
          .map((movie) => MovieApi.fromJson(movie))
          .toList();
    } else {
      return []; // إرجاع قائمة فارغة بدلًا من null
    }
  } catch (e) {
    throw Exception('Error occurred while fetching cast: $e');
  }
}


}
