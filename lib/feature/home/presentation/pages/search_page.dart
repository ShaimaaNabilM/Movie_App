import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      appBar: AppBar(
        title: Text('Search', style: TextStyle(color: AppColors.kWhiteColor)),
        backgroundColor: AppColors.kBlackColor,
      ),
      body: Center(
        child: Text(
          'Search Page',
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
      ),
    );
  }
}
