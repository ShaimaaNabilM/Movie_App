import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/feature/firstPage/presentation/pages/details_movie.dart';
import 'package:movie_app/feature/home/data/models/movie_model.dart';
import 'package:movie_app/feature/home/data/movie_api_service.dart';
import 'package:movie_app/feature/search/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchPage extends StatefulWidget {
  final MovieService movieService = MovieService();

  SearchPage({Key? key, }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FloatingSearchBarController controller = FloatingSearchBarController();
  final SpeechToText speechToText = SpeechToText();
  bool _isListening = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.kBlackColor,
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.05, // Adjust this value to move the text down or up
              left: screenWidth * 0.2, // Adjust left to center text
              child: Text(
                'What would you\n   like to watch?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.kWhiteColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, right: 20, left: 20),
              child: buildSearchBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Consumer<SearchModel>(
      builder: (BuildContext context, SearchModel model, _) => FloatingSearchBar(
        controller: controller,
        progress: model.isLoading,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: model.onQueryChanged,
        actions: [
          FloatingSearchBarAction(
            child: IconButton(
              icon: const Icon(Icons.mic),
              onPressed: _toggleListening,
            ),
          ),
          FloatingSearchBarAction.searchToClear(showIfClosed: false),
        ],
        builder: (BuildContext context, _) => model.isLoading
            ? const Center(child: CircularProgressIndicator())
            : buildExpandableBody(model),
      ),
    );
  }

  Widget buildExpandableBody(SearchModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.suggestions.length,
          itemBuilder: (BuildContext context, int index) {
            MovieApi movie = model.suggestions[index];
            return buildItem(context, movie,  );
          },
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, MovieApi movie,) {
      print("movie.videoKey ${movie.videoKey}");

    return InkWell(
      onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movie: movie, ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 18, color:  AppColors.kBlackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toggleListening() async {
    if (_isListening) {
      await speechToText.stop();
    } else {
      bool available = await speechToText.initialize();
      if (available) {
        setState(() {
          _isListening = true;
        });
        speechToText.listen(onResult: (result) {
          controller.query = result.recognizedWords;
        });
      }
    }
  }

  
}
