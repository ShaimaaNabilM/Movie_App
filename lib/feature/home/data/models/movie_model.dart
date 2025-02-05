class MovieApi {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double rating;
  final String releaseDate;
  final List<String> genres;
  final int runtime;
  final String? videoKey;
  final String profilePath;
    final String name;


  MovieApi(
     {
          required this.name,

      required  this.profilePath, 
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.rating,
    required this.releaseDate,
    required this.genres,
    required this.runtime, required this.videoKey,
  });

  factory MovieApi.fromJson(Map<String, dynamic> json) {
    return MovieApi(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      rating: (json['vote_average'] ?? 0).toDouble(),
      videoKey: json['video_key'],
      releaseDate: json['release_date'] ?? 'N/A',
      genres: (json['genres'] as List<dynamic>?)
              ?.map((genre) => genre['name'] as String)
              .toList() ??
          [],
      runtime: json['runtime'] ?? 0,
      profilePath: json['profile_path'] != null 
  ? 'https://image.tmdb.org/t/p/w500${json['profile_path']}' 
  : 'https://images.app.goo.gl/GVTCUgP96gTPNeLr7',
      name: json['name'] ?? 'Unknown Cast', // القيمة الافتراضية إذا كانت null
      

    );
  }

  static List<MovieApi> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieApi.fromJson(json)).toList();
  }


}
