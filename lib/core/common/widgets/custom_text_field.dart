import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        obscureText: isPassword,
        style: const TextStyle(color: AppColors.kWhiteColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.kGreyColor),
          prefixIcon: Icon(icon, color: AppColors.kGreyColor),
          filled: true,
          fillColor: AppColors.kBlackColor.withAlpha(128),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
