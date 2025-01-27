import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // إضافة مكتبة ScreenUtil
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/feature/firstPage/presentation/pages/details_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true, 
      splitScreenMode: true, 
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
            primarySwatch: Colors.blue,
          ),
          home:  DetailsScreen(),
        );
      },
    );
  }
}
