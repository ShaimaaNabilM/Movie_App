import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:implicitly_animated_reorderable_list_2/transitions.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:movie_app/core/themes/text_style.dart';
import 'package:movie_app/feature/firstPage/presentation/widgets/filter.dart';
import 'package:movie_app/feature/search/infosearch_movie.dart';
import 'package:movie_app/feature/search/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _HomeState();
}

class _HomeState extends State<SearchPage> {
  final FloatingSearchBarController controller = FloatingSearchBarController();
  final SpeechToText speechToText = SpeechToText();
  bool _isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBlackColor,
        body: SizedBox(
          child: Stack(
            children: [
              FilterWidget(),
              Positioned(
                top:50.h,
                left:200.w,
                child:  Text(
                      'What would you\n   like to watch?',
                      style: AppTextStyles.size28BoldWhiteColor,
                        
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(top:150,right:20,left:20),
                child: buildSearchBar(),
              ),
        ],
        ),),
        );
  }

  Widget buildSearchBar() {
    final List<FloatingSearchBarAction> actions = <FloatingSearchBarAction>[
      FloatingSearchBarAction(
        child: IconButton(
          icon: const Icon(Icons.mic),
          onPressed: _toggleListening,
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ];

    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Consumer<SearchModel>(
      builder: (BuildContext context, SearchModel model, _) =>
          FloatingSearchBar(
        title: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey, size: 24),
            const SizedBox(width: 3.11),
            const Text(
              'Search',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
        controller: controller,
        iconColor: Colors.grey,
        transitionDuration: const Duration(milliseconds: 800),
        transitionCurve: Curves.easeInOutCubic,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        actions: actions,
        progress: model.isLoading,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: model.onQueryChanged,
        border: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
        backdropColor: Colors.transparent,
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
        // color: Color.fromARGB(0, 255, 255, 255),
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: ImplicitlyAnimatedList<Movie>(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          items: model.suggestions,
          insertDuration: const Duration(milliseconds: 700),
          itemBuilder: (BuildContext context, Animation<double> animation,
              Movie item, _) {
            return SizeFadeTransition(
              animation: animation,
              child: buildItem(context, item),
            );
          },
          updateItemBuilder:
              (BuildContext context, Animation<double> animation, Movie item) {
            return FadeTransition(
              opacity: animation,
              child: buildItem(context, item),
            );
          },
          areItemsTheSame: (Movie a, Movie b) => a == b,
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, Movie movie) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final SearchModel model = Provider.of<SearchModel>(context, listen: false);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () {
            FloatingSearchBar.of(context)?.close();
            Future<void>.delayed(
              const Duration(milliseconds: 500),
              () => model.clear(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Row(
              children: <Widget>[
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        movie.name,
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (model.suggestions.isNotEmpty && movie != model.suggestions.last)
          const Divider(height: 0),
      ],
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

  @override
  void dispose() {
    controller.dispose();
    speechToText.stop();
    super.dispose();
  }
}
