import 'package:flutter/cupertino.dart';
import 'package:flutter_application_b1909960/models/movie.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List _favoriteMovies = [];

  // ignore: non_constant_identifier_names
  get FavoriteMovies => _favoriteMovies;

  void toggleFavorite(Movie movie) {
    Object obj = {
      'id': movie.id,
      'title': movie.title,
      'desciption': movie.description,
      'year': movie.year,
      'star': movie.star,
      'genre': movie.genre,
      'image': movie.image,
      'video': movie.video,
    };

    if (_favoriteMovies.isEmpty) {
      _favoriteMovies.add(obj);
    } else {
      if (_favoriteMovies.toString().contains(obj.toString())) {
        for (var i = 0; i < _favoriteMovies.length; i++) {
          if (ObjectKey(_favoriteMovies[i]).value.toString() ==
              ObjectKey(obj).value.toString()) {
            _favoriteMovies.removeAt(i);
          }
        }
      } else {
        _favoriteMovies.add(obj);
      }
    }

    notifyListeners();
  }

  void removeFavorite(index) {
    _favoriteMovies.removeAt(index);

    notifyListeners();
  }

  bool isExist(Movie movie) {
    Object obj = {
      'id': movie.id,
      'title': movie.title,
      'desciption': movie.description,
      'year': movie.year,
      'star': movie.star,
      'genre': movie.genre,
      'image': movie.image,
      'video': movie.video,
    };
    final isExist = _favoriteMovies.toString().contains(obj.toString());
    return isExist;
  }

  void clearFavorite() {
    _favoriteMovies.clear();
    notifyListeners();
  }
}
