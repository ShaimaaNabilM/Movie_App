import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';

class MovieInfo extends StatelessWidget {
  final MovieApi movie;

  const MovieInfo({super.key, required this.movie, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          movie.title,
          style: AppTextStyles.size17BoldWhiteColor,
        ),
         SizedBox(height: 16.h),
        Text('${movie.releaseDate}•${movie.genres}•${movie.runtime ~/ 60}h${movie.runtime % 60}m',

          style: AppTextStyles.size13RegularWhiteColor
        ),
         SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            10,
            (index) => Icon(
              Icons.star,
              color: index < movie.rating.round() ? AppColors.kYellowColor : AppColors.kGreyColor,
            ),
          ),
        ),
         SizedBox(height: 16.h),
        Text(
          movie.overview,
          textAlign: TextAlign.center,
      
          style: AppTextStyles.size17RegularWhiteColor,
        ),
      ],
    );
  }
}
