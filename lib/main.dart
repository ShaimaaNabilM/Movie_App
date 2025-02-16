import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/category/presentation/bloc/genres_cubit.dart';
import 'feature/firstPage/presentation/pages/first_page.dart';
import 'feature/home/presentation/bloc/movies_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoviesCubit()..fetchMovies()),
        BlocProvider(create: (context) => GenresCubit()..fetchGenres()), // تحميل الأقسام عند بدء التطبيق
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movie App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const FirstPage(),
          );
        },
      ),
    );
  }
}
