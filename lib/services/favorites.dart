import 'package:flutter/foundation.dart';

class Favorites with ChangeNotifier {
  Set<String> _favorites;

  Favorites() {
    _favorites = Set();
  }

  bool isFavorite(String letter) {
    return _favorites.contains(letter);
  }

  void toggleFavorite(String letter) {
    if (_favorites.contains(letter)) {
      _favorites.remove(letter);
    } else {
      _favorites.add(letter);
    }
    notifyListeners();
  }
}
