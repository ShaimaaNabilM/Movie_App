import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/feature/firstPage/presentation/pages/first_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/feature/firstPage/presentation/pages/details_movie.dart';
import 'package:movie_app/feature/firstPage/presentation/pages/search_page.dart';
import 'package:provider/provider.dart';

import 'feature/search/search_provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchModel()),
      ],
      child: const MyApp(),
    ),
  );
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
          home:  SearchPage(),
        );
      },
    );
  }
}
