import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
// import 'package:movie_app/feature/firstPage/presentation/widgets/custom_cornerClipper.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/detalils_moviewidget/customcasts_row.dart';

class CastsList extends StatelessWidget {
  // final List<Cast> casts;

  const CastsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Casts",
                style: AppTextStyles.size20BoldWhiteColor,
              ),
            ),
             SizedBox(height: 14.h),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة في كل صف
              crossAxisSpacing: 10.h, // المسافة بين الأعمدة
              mainAxisSpacing: 8.w, // المسافة بين الصفوف
              childAspectRatio: 10 / 3,
                    ),
                 itemBuilder:  (context, index) {
              return CustomcastsRow();
                    },),
            ),
          ],
        ),
    );
  }
}
