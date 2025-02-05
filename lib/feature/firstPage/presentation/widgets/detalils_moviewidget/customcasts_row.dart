import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/custom_cornerClipper.dart';

class CustomcastsRow extends StatelessWidget {
  // final MovieService movieService = MovieService();
  final String name;
    final String profilePath;

  const CustomcastsRow({
    super.key, required this.name, required this.profilePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 75.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(profilePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Center(
            child: ClipPath(
              clipper: CustomLeftCornerClipper(),
              child: Container(
                width: 107.w,
                height: 65.h,
                decoration: const BoxDecoration(
                  color: AppColors.kGreyColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment
                          .centerLeft, // النص في المنتصف وقريب من اليسار
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 17), // مسافة من الحافة اليسرى
                        child: Text(
                          name,
                          style: AppTextStyles.size13RegularWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
