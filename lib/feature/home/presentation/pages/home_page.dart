
  import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
@override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;//علشان يكون متجاوب مع كل الاجهزه
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      extendBody: true,
      body: SizedBox(
        width: screenWidth,
        height: screenHight,
        child: Stack(children: [
          Positioned(
            top: screenHight * 0.1,
            left: -88,
            child: Container(
              height: 166,
              width: 166,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kGreenColor,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200), //blur pink in page 
                child: const SizedBox(
                  height: 166,
                  width: 166,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHight * 0.3,
            right: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kPinkColor,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),//blur green in same page
                child: Container(
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
          Center(
            child: SafeArea(
              child: Column(  
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenHight * 0.07,
                  ),
                
                ],
              ),
            ),
          ),
        ]),
      ),
      );
  }

}