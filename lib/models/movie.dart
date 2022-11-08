class Movie {
  final String title;
  final String genre;

  Movie({
    required this.title,
    required this.genre,
  });

  Movie.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          genre: json['genre']! as String,
        );
  Map<String, Object?> toJson() {
    return {
      'title': title,
      'genre': genre,
    };
  }
}
