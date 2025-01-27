import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/core/common/custom_Background.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/feature/home/presentation/widgets/movie.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            const Background(),
            SingleChildScrollView(
              child: Center(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        "What would you like\n to watch?",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.size28BoldWhiteColor,
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      MovieS(
                        title: "New movies",
                        movieImages: [
                          "assets/images/img-aquaman.jpg",
                          "assets/images/img-batman.jpg",
                          "assets/images/img-eternals.jpg",
                          "assets/images/img-sonic.jpg",
                          "assets/images/img-batman.jpg",
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      MovieS(
                        title: "Upcoming movies",
                        movieImages: [
                          "assets/images/img-batman.jpg",
                          "assets/images/img-aquaman.jpg",
                          "assets/images/img-eternals.jpg",
                          "assets/images/img-batman.jpg",
                          "assets/images/img-sonic.jpg",
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
