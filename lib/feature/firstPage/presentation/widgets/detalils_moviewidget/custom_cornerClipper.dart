
import 'package:flutter/material.dart';

class CustomLeftCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0); // النقطة الأولى: أعلى اليسار
    path.lineTo(size.width, 0); // الخط العلوي
    path.lineTo(size.width, size.height); // الخط الأيمن
    path.lineTo(0, size.height); // الخط السفلي

    // رسم المنحنى على الحافة اليسرى
    path.quadraticBezierTo(
      size.width * 0.1, size.height * 0.5, // نقطة التحكم
      0, 0, // نهاية المنحنى عند أعلى اليسار
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}