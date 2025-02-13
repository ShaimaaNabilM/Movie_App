import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/common/custom_Background.dart';
import 'package:movie_app/core/themes/app_colors.dart';

import '../../model/genre.dart';
import '../bloc/genres_cubit.dart';
import '../bloc/movies_cubit.dart';
import 'movies_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<GenresCubit>().fetchGenres(); // جلب الأقسام عند فتح الصفحة
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: AppColors.kBlackColor,
        title: const Text(
          "Movie Categories",
          style: TextStyle(color: AppColors.kWhiteColor),
        ),
      ),
      body: BlocBuilder<GenresCubit, List<Genre>>(
        builder: (context, genres) {
          if (genres.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          _tabController = TabController(length: genres.length, vsync: this);

          return Column(
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: AppColors.kPinkColor,
                labelColor: AppColors.kWhiteColor,
                unselectedLabelColor: Colors.grey,
                tabs: genres.map((genre) => Tab(text: genre.name)).toList(),
              ),
              Expanded(
                child: Stack(
                  children: [
                    const Background(),
                    TabBarView(
                      controller: _tabController,
                      children: genres.map((genre) =>
                          BlocProvider(
                            create: (context) => MoviesCubit()..fetchMoviesByGenre(genre.id),
                            child: MoviesScreen(genreId: genre.id),
                          )
                      ).toList(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
