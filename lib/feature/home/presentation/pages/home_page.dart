import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/feature/home/presentation/widgets/bottom_bar.dart';
import 'package:movie_app/feature/home/presentation/widgets/movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            Positioned(
              top: screenHeight * 0.1,
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kGreenColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.3,
              right: -100,
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPinkColor,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                  child: const SizedBox(),
                ),
              ),
            ),
            
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
            const BottomBar(),  
          ],
        ),
      ),
    );
  }
}
