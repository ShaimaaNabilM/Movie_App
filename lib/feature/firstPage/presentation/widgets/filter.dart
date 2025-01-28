import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        height: screenHight,
        width: screenWidth,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kGreenColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 300,
                    sigmaY: 300,
                  ),
                  child: Container(
                    height: 200.h,
                    width: 200.w,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHight * 0.4,
              right: -88,
              child: Container(
                height: 166.h,
                width: 166.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kPinkColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 400,
                    sigmaY: 500,
                  ),
                  child: Container(
                    height: 166.h,
                    width: 166.w,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100.h,
              left: -100.w,
              child: Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kCyanColor.withOpacity(0.5),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 300,
                    sigmaY: 300,
                  ),
                  child: Container(
                    height: 200.h,
                    width: 200.w,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),

        
        
       
        ])
        );
  }
}