import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movieDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  late SharedPreferences prefs;
  List<MovieDetailsModel> _favoriteMovies = [];

  FavoritesProvider() {
    _initialize();
  }

  List<MovieDetailsModel> get favoriteMovies => _favoriteMovies;

  Future<void> _initialize() async {
    await loadFavoriteMovies();
  }

  Future<void> loadFavoriteMovies() async {
    prefs = await SharedPreferences.getInstance();
    final favoritesString = prefs.getString('favorites');
    if (favoritesString != null) {
      final List<dynamic> favoritesJson = jsonDecode(favoritesString);
      _favoriteMovies = favoritesJson
          .map((favJson) => MovieDetailsModel.fromJson(favJson))
          .toList();
    } else {
      _favoriteMovies = [];
    }
    notifyListeners();  // Notify listeners to update the UI after loading favorites
  }

  Future<void> saveFavoriteMovies() async {
    final favoritesString =
    jsonEncode(_favoriteMovies.map((fav) => fav.toJson()).toList());
    await prefs.setString('favorites', favoritesString);
  }

  bool isFavorite(MovieDetailsModel movie) {
    return _favoriteMovies.contains(movie);
  }

  void addFavorite(MovieDetailsModel movie) {
    _favoriteMovies.add(movie);
    saveFavoriteMovies();
    notifyListeners();
  }

  void removeFavorite(MovieDetailsModel movie) {
    _favoriteMovies.remove(movie);
    saveFavoriteMovies();
    notifyListeners();
  }
}
