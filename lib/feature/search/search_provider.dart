import 'package:flutter/cupertino.dart';
import 'package:movie_app/feature/search/infosearch_movie.dart';



class SearchModel extends ChangeNotifier {
  bool isLoading = false;
  List<Movie> _suggestions = [];
  List<Movie> get suggestions => _suggestions;

  List<String> searchHistory = [];

  void onQueryChanged(String query) {
    if (query.isNotEmpty) {
      isLoading = true;
      notifyListeners();

      // Simulate a search delay
      Future.delayed(const Duration(seconds: 1), () {
        _suggestions = _getSuggestions(query);

        if (!searchHistory.contains(query)) {
          searchHistory.add(query);
        }

        isLoading = false;
        notifyListeners();
      });
    } else {
      _suggestions = [];
      notifyListeners();
    }
  }

  List<Movie> _getSuggestions(String query) {
    return List.generate(
      10,
      (index) => Movie(
        '$query $index',
        // 'Address $index for $query',
      ),
    );
  }

  void clear() {
    _suggestions = [];
    notifyListeners();
  }
}

