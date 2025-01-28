import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/custom_player.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/details_section.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/icons_header.dart';

class CustomHeader extends StatelessWidget {
  // final String image;

  const CustomHeader({super.key, });

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
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
                  image: AssetImage("assets/images/img-eternals.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,

                ),
              ),
            ),
          ),
          Positioned(
            top: screenHight * 0.05,
            left: 0,
            right: 0,
            child: IconsHeader(),
          ),
          Positioned(
            right: 15,
              top: screenHight * 0.65,
            child: CustomPlayer(),),
            Positioned(
              top: 500.h,
              bottom: 0,
              left: 0,
              right: 0,
              child: MovieInfo(),),
        ],
      ),
    );
  }
}
