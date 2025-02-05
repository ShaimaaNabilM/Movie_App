import 'package:flutter/material.dart';
import 'package:movie_app/core/common/custom_Background.dart';
import 'package:movie_app/core/themes/app_colors.dart';
class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<String> movieCategories = [
      "Action",
      "Comedy",
      "Drama",
      "Horror",
      "Sci-Fi"
    ];

    return DefaultTabController(
      length: movieCategories.length,
      child: Scaffold(
        backgroundColor: AppColors.kBlackColor,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: AppColors.kBlackColor,
          title: const Text(
            "Movie Categories",
            style: TextStyle(color: AppColors.kWhiteColor),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: AppColors.kPinkColor,
            tabs: movieCategories
                .map((category) => Tab(text: category))
                .toList(),
          ),
        ),
        body: SizedBox(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              const Background(), 
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
