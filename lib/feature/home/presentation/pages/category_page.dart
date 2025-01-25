import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class CategoryPage extends StatelessWidget {  
   const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        title: Text('Category', style: TextStyle(color: AppColors.kWhiteColor)),
        backgroundColor: AppColors.kBlackColor,
      ),
      body: Center(
        child: Text(
          'Category Page',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
      ),
    );
  }
}
