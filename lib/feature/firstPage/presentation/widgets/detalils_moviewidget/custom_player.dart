import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/feature/firstPage/presentation/pages/video_player.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';

class CustomPlayer extends StatelessWidget {
  final MovieApi movie;

  const CustomPlayer({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (movie.videoKey != null && movie.videoKey!.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomVideoPlayer(video: movie.videoKey!),
            ),
          );
        } else {
          // يمكن عرض رسالة للمستخدم في حال لم يكن هناك فيديو
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No video available for this movie")),
          );
        }
      },
      child: Container(
        height: 58,
        width: 58,
        padding: const EdgeInsets.all(1.5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            AppColors.fristGradientColor,
            AppColors.secondGradientColor,
          ]),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.kGreyColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow_sharp,
            color: AppColors.kWhiteColor,
            size: 40,
          ),
        ),
      ),
    );
  }
}
