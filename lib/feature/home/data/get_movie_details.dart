
import 'package:movie_app/feature/home/data/models/movie_model.dart';
import 'package:movie_app/feature/home/data/movie_api_service.dart';

class GetMovieDetails {
  final MovieService movieService;

  GetMovieDetails(this.movieService);

  Future<MovieApi> execute(int id) async {
    return await movieService.getMovieDetails(id);
  }
}
