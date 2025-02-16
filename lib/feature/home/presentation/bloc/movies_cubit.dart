import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_service.dart';
import '../../models/movie_model.dart';

class MoviesCubit extends Cubit<Map<String, List<MovieModel>>> {
  MoviesCubit() : super({});

  final ApiService apiService = ApiService();

  Future<void> fetchMovies() async {
    try {
      final popularMovies = await apiService.getMoviesByCategory("popular");
      final upcomingMovies = await apiService.getMoviesByCategory("upcoming");

      emit({
        "popular": popularMovies,
        "upcoming": upcomingMovies,
      });
    } catch (e) {
      emit({});
    }
  }
}
