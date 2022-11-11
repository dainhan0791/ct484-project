class Movie {
  final String id;
  final String title;
  final String description;
  final String year;
  final String star;
  final String genre;
  final String image;
  final String video;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.year,
    required this.star,
    required this.genre,
    required this.image,
    required this.video,
  });

  Movie.fromJson(Map<String, Object?> json)
      : this(
          id: json['id']! as String,
          title: json['title']! as String,
          description: json['description']! as String,
          year: json['year']! as String,
          star: json['star']! as String,
          genre: json['genre']! as String,
          image: json['image']! as String,
          video: json['video']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'year': year,
      'star': star,
      'genre': genre,
      'image': image,
      'video': video,
    };
  }
}
