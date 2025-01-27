
import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/text_style.dart';

class MovieS extends StatelessWidget {
  final String title;
  final List<String> movieImages;

  const MovieS({
    required this.title,
    required this.movieImages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: AppTextStyles.size16RegularWhiteColor,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieImages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 20),
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(movieImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
