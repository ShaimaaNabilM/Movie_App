import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';


class CustomPlayer extends StatelessWidget {
  const CustomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 58,
      padding: const EdgeInsets.all(1.5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            AppColors.fristGradientColor,
            AppColors.secondGradientColor,
          ])),
      child: Container(
          decoration:  BoxDecoration(
            color: AppColors.kGreyColor.withValues(alpha: 20),
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow_sharp,
                color: AppColors.kWhiteColor,
                size: 40,
                
              ))),
    );
  }
}
