import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/themes/app_colors.dart';

import '../../models/movie.dart';
import '../bloc/movies_cubit.dart';

class MoviesScreen extends StatelessWidget {
  final int genreId;

  const MoviesScreen({Key? key, required this.genreId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, List<Movie>>(
      builder: (context, movies) {
        if (movies.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عرض عمودين
            childAspectRatio: 0.65, // تقليل نسبة الارتفاع مقارنة بالعرض
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      color: Colors.black.withOpacity(0.7),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
