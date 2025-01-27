import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/themes/app_colors.dart';
// import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/casts_section.dart';
// import 'package:movie_app/feature/firstPage/presentation/widgets/details_section.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/header-section.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  // final movie = MovieService().getMovieDetails();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: Column(
      children: [
        CustomHeader(),
         SizedBox(height: 16.h),
        Container(
        height: 2,
        width: screenWidth * 0.8,
        color: AppColors.kWhiteColor
              ),
        const SizedBox(height: 16),
        CastsList(),
    
      ],
    ),
       
    );
    
  }
}
