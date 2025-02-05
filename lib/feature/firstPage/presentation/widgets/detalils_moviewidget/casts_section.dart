import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/customcasts_row.dart';
import 'package:movie_app/feature/home/data/models/casts_model.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';
import 'package:movie_app/feature/home/data/movie_api_service.dart';

class CastsList extends StatelessWidget {
  final MovieApi movie;
  final MovieService movieService = MovieService();

  CastsList({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieApi>>(
      future: movieService.getCastsInfo(movie.id), // استخدام movieId الذي يتم تمريره
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No casts available"));
        }

        List<MovieApi> castsList = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Casts",
                  style: AppTextStyles.size20BoldWhiteColor,
                ),
              ),
              SizedBox(height: 14.h),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: castsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.h,
                    mainAxisSpacing: 8.w,
                    childAspectRatio: 10 / 3,
                  ),
                  itemBuilder: (context, index) {
                    // final cast = castsList[index];
                    // final castName = cast.name ?? 'Unknown';
                    // final profilePath = cast.profilePath ?? 'default_path';

                    return CustomcastsRow(
                      name: movie.name,
                      profilePath: movie.profilePath,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
