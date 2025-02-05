import 'package:movie_app/feature/home/data/models/casts_model.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';
import 'package:movie_app/feature/home/data/movie_api_service.dart';

class GetMovieDetails {
  final MovieService movieService;

  GetMovieDetails(this.movieService);

  Future<List<MovieApi>> execute(int id) async {
    return await movieService.getCastsInfo(id);
  }
}
