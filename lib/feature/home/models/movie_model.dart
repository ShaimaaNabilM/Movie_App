

class MovieModel {
  final String title;
  final String posterPath;

  MovieModel({required this.title, required this.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json["title"] ?? "No Title",
      posterPath: json["poster_path"] ?? "",
    );
  }
}
