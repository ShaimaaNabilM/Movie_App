import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/custom_Background.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/feature/home/presentation/widgets/movie.dart';

import '../../models/movie_model.dart';
import '../bloc/movies_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            const Background(),
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

                      // 🔹 عرض الأفلام باستخدام BlocBuilder
                      BlocBuilder<MoviesCubit, Map<String, List<MovieModel>>>(
                        builder: (context, moviesData) {
                          if (moviesData.isEmpty) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          return Column(
                            children: [
                              MovieS(
                                title: "Popular Movies",
                                movies: moviesData["popular"] ?? [],
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              MovieS(
                                title: "Upcoming Movies",
                                movies: moviesData["upcoming"] ?? [],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
