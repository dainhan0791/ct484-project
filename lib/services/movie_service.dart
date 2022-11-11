import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_b1909960/models/movie.dart';
import 'package:meta/meta.dart';

class MovieService {
  final moviesRef =
      FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
            fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );

  Future<void> addMovie({
    required String id,
    required String title,
    required String description,
    required String year,
    required String star,
    required String genre,
    required String image,
    required String video,
  }) async {
    await moviesRef
        .doc(
          id.toString().trim(),
        )
        .set(
          Movie(
            id: id.toString().trim(),
            title: title.toString().trim(),
            description: description.toString().trim(),
            year: year.toString().trim(),
            star: id.toString().trim(),
            genre: genre.toString().trim(),
            image: image.toString().trim(),
            video: video.toString().trim(),
          ),
        );
  }

  Future<void> updateMovie({
    required String id,
    required String title,
    required String description,
    required String year,
    required String star,
    required String genre,
    required String image,
    required String video,
  }) async {
    await moviesRef
        .doc(
      id.toString().trim(),
    )
        .update(
      {
        'id': id.toString().trim(),
        'title': title.toString().trim(),
        'description': description.toString().trim(),
        'year': year.toString().trim(),
        'star': id.toString().trim(),
        'genre': genre.toString().trim(),
        'image': image.toString().trim(),
        'video': video.toString().trim(),
      },
    );
  }

  Future<void> deleteMovie({
    required String id,
  }) async {
    await moviesRef
        .doc(
          id.toString().trim(),
        )
        .delete();
  }
}
