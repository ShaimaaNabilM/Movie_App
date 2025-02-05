import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/header-section.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';
import 'package:movie_app/feature/home/data/movie_api_service.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key,  required this.movie, }) : super(key: key);

  final MovieApi movie;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final MovieService movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder<List<dynamic>>(
      future: Future.wait([
        movieService.getMovieDetails(widget.movie.id),
        movieService.getMovieVideoKey(widget.movie.id),
        // movieService.getCastsInfo(widget.movie.id),
      ]),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text("Error: ${snapshot.error}")));
        } else if (!snapshot.hasData) {
          return const Scaffold(body: Center(child: Text("No data")));
        } else {
          final movieDetails = snapshot.data![0] as MovieApi;
          final videoUrl = snapshot.data![1] as String;

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 205, 205, 226),
            body: Stack(
              children: [
                CustomHeader(movie: movieDetails, videoUrl: videoUrl),

                Container(
                  height: 2,
                  width: screenWidth * 0.8,
                  color: AppColors.kWhiteColor,
                ),
                const SizedBox(height: 16),
                // Positioned(
                //   top: 20, 
                //   left: 0,
                //   right: 0,
                //    child: CastsList(movie: movieDetails,), 
                // ),
              ],
            ),
          );
        }
      },
    );
  }
}
