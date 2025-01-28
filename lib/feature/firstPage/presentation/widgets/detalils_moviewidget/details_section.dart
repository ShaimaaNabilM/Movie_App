import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';

class MovieInfo extends StatelessWidget {
  // final Movie movie;

  const MovieInfo({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Eternals",
          style: AppTextStyles.size17BoldWhiteColor,
        ),
         SizedBox(height: 16.h),
        Text("2021•Action-Adventure-Fantasy•2h36m",
          // "${movie.year} • ${movie.genres} • ${movie.duration}",
          style: AppTextStyles.size13RegularWhiteColor
        ),
         SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < 3 ? AppColors.kYellowColor : AppColors.kGreyColor,
              // color: index < movie.rating.round() ? Colors.yellow : Colors.white30,
            ),
          ),
        ),
         SizedBox(height: 16.h),
        Text(
          // movie.description,
          "The saga of the Eternals, a race of \nimmortal beings who lived on Earth \nand shaped its history and \ncivilizations.",
          textAlign: TextAlign.center,
      
          style: AppTextStyles.size17RegularWhiteColor,
        ),
      ],
    );
  }
}
