import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/custom_player.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/details_section.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/icons_header.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';
import 'package:movie_app/feature/home/data/movie_api_service.dart';

class CustomHeader extends StatelessWidget {
  final MovieApi movie;
  final MovieService movieService = MovieService();

  CustomHeader({super.key, required this.movie, required String videoUrl});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<String?>(
      future: movieService.getMovieVideoKey(movie.id), // جلب الفيديو من API
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: Text('No video available'));
        } else {
          final videoUrl = snapshot.data!;
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Color(0xFF19191B),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 577.h,
                    width: 391.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://image.tmdb.org/t/p/w500/${movie.posterPath}"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.05,
                  left: 0,
                  right: 0,
                  child: IconsHeader(movie: movie,),
                ),
                Positioned(
                  right: 15,
                  top: screenHeight * 0.65,
                  child: CustomPlayer(movie: movie,), // تمرير videoUrl هنا
                ),
                Positioned(
                  top: 500.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: MovieInfo(
                    movie: movie,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
