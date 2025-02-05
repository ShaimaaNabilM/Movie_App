import 'package:flutter/material.dart';
import 'package:movie_app/feature/firstPage/presentation/pages/search_page.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';

import '../feature/category/presentation/pages/category_page.dart';
import '../feature/home/presentation/pages/home_page.dart';




class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    CategoryPage(),
    // SearchPage(movies: MovieApi),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}


