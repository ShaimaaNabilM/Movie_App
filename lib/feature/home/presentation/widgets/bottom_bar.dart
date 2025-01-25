
import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/presentation/pages/category_page.dart';
import 'package:movie_app/feature/home/presentation/pages/home_page.dart';
import 'package:movie_app/feature/home/presentation/pages/search_page.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.kBlackColor.withAlpha(128),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: [
              AppColors.kBlackColor.withAlpha(128),
              AppColors.kPinkColor.withAlpha(128),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              icon: Icons.home,
              page: const HomePage(),
            ),
            _buildNavItem(
              context,
              icon: Icons.search,
              page: const SearchPage(),
            ),
            _buildNavItem(
              context,
              icon: Icons.category,
              page: const CategoryPage(),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildNavItem(BuildContext context,
      {required IconData icon, required Widget page}) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      icon: Icon(
        icon,
        color: AppColors.kWhiteColor.withAlpha(128),
        size: 28,
      ),
    );
  }
}
