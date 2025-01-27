import 'package:flutter/material.dart';
import 'package:movie_app/core/common/custom_Background.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/core/common/widgets/custom_outline.dart';
import 'package:movie_app/feature/auth/presentation/register_view/register_screen.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
            Center(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.07,
                    ),
                    CustomOutline(
                      strokeWidth: 4,
                      radius: screenWidth * 0.8,
                      padding: const EdgeInsets.all(4),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.kPinkColor,
                          AppColors.kPinkColor.withAlpha(0),
                          AppColors.kGreenColor.withAlpha(25),
                          AppColors.kGreenColor,
                        ],
                        stops: const [0.2, 0.4, 0.6, 1],
                      ),
                      width: screenWidth * 0.8,
                      height: screenWidth * 0.8,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/img-onboarding.png'),
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.09,
                    ),
                    Text(
                      'Watch movies in \n Virtual Reality',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.size34BoldWhiteColor,
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Text(
                      'Download and watch offline\n wherever you are ',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.size16RegularWhiteColor,
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: CustomOutline(
                        strokeWidth: 3,
                        radius: 20,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.kBlackColor,
                            AppColors.kGreenColor,
                          ],
                        ),
                        width: 160,
                        height: 38,
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.kPinkColor.withAlpha(128),
                                AppColors.kGreenColor.withAlpha(128),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.size14RegularWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
