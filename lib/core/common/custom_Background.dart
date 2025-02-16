import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned(
          top: screenHeight * 0.1,
          left: -88,
          child: Container(
            height: 166,
            width: 166,
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
        Positioned(
          top: screenHeight * 0.3,
          right: -100,
          child: Container(
            height: 200,
            width: 200,
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
      ],
    );
  }
}