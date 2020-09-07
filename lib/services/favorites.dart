import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites with ChangeNotifier {
  Set<String> _favorites;

  Favorites() {
    _favorites = Set();
    retrieveFavorites();
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
    saveFavorites();
  }

  void retrieveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _favorites = (prefs.getStringList('favorites') ?? []).toSet();
  }

  void saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', _favorites.toList());
  }
}
