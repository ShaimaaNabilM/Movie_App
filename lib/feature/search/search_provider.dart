import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';

class SearchModel extends ChangeNotifier {
  bool isLoading = false;
  List<MovieApi> _suggestions = []; // استخدام النوع الصحيح
  List<MovieApi> get suggestions => _suggestions;

  List<String> searchHistory = [];

  Future<void> onQueryChanged(String query) async {
    if (query.isNotEmpty) {
      isLoading = true;
      notifyListeners();

      try {
        final Dio dio = Dio();
        final Response response = await dio.get(
          "https://api.themoviedb.org/3/search/movie",
          queryParameters: {
            'api_key': '492e4145e722fe2ef92ed803fbfc82cd',
            'query': query,
            'include_adult': 'false',
            'language': 'en-US',
            'page': 1,
          },
        );
        print('Response Data: ${response.data}');

        // تحديث القائمة بالنتائج الجديدة
        _suggestions = (response.data['results'] as List)
            .map((movieData) => MovieApi.fromJson(movieData))
            .toList();


        if (!searchHistory.contains(query)) {
          searchHistory.add(query);
        }
      } catch (e) {
        print('Error fetching movies: $e');
        _suggestions = [];
      }

      isLoading = false;
      notifyListeners();
    } else {
      _suggestions = [];
      notifyListeners();
    }
  }

  void clear() {
    _suggestions = [];
    notifyListeners();
  }
}
