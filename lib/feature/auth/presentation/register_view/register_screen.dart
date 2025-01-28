import 'package:flutter/material.dart';
import 'package:movie_app/core/common/custom_Background.dart';
import 'package:movie_app/core/common/widgets/custom_outline.dart';
import 'package:movie_app/core/common/widgets/custom_text_field.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/layout/bottom_nav.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      "Create Account",
                      style: AppTextStyles.size28BoldWhiteColor,
                    ),
                    const SizedBox(height: 24),
                    const CustomTextField(
                      hintText: "Email",
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16),
                    const CustomTextField(
                      hintText: "Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),
                    const CustomTextField(
                      hintText: "Confirm Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNav(),
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
                              style: AppTextStyles.size13RegularWhiteColor,
                            ),
                          ),
                        ),
                      ),
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
