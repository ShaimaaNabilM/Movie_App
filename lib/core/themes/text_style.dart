import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/themes/app_colors.dart';


class AppTextStyles {
  static TextStyle size34BoldWhiteColor = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kWhiteColor, 
  );
   static TextStyle size16RegularWhiteColor = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w100,
    color: AppColors.kWhiteColor.withAlpha((255 * 0.7).toInt()), 
  );
  static TextStyle size13RegularWhiteColor = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kWhiteColor, 
  );
 
static TextStyle size28BoldWhiteColor = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kWhiteColor, 
  );
  static TextStyle size17RegularWhiteColor = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kWhiteColor, 
  );
  static TextStyle size17BoldWhiteColor = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kWhiteColor, 
  );
  static TextStyle size13BoldWhiteColor = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w100,
    color: AppColors.kWhiteColor, 
  );
  static TextStyle size20BoldWhiteColor = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.kWhiteColor, 
  );
}


