import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // قائمة بأنواع الأفلام
    final List<String> movieCategories = [
      "Action",
      "Comedy",
      "Drama",
      "Horror",
      "Sci-Fi"
    ];

    return DefaultTabController(
      length: movieCategories.length, // عدد التبويبات
      child: Scaffold(
        backgroundColor: AppColors.kBlackColor,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: AppColors.kBlackColor,
          title: const Text("Movie Categories",style: TextStyle(color: AppColors.kWhiteColor),),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColors.kPinkColor,
            tabs: movieCategories
                .map((category) => Tab(text: category)) // إنشاء التبويبات
                .toList(),
          ),
        ),
        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              // الدوائر الملونة
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
              // محتوى التبويبات
              TabBarView(
                children: movieCategories
                    .map((category) => Center(
                  child: Text(
                    "You selected: $category",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
