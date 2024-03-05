import 'package:flutter/material.dart';

import 'package:rick_morty_flutter/src/features/favorites_list/domain/favorites_model.dart';

class FavoritesListProvider extends ChangeNotifier {
  List<FavoritesModel> favoriteCharacters = [];

  //TOGGLE FUNCTIONALITY
  void toggleFavorite(FavoritesModel character) {
    final index = favoriteCharacters.indexOf(character);
    if (index == -1) {
      favoriteCharacters.add(character);
    } else {
      favoriteCharacters.removeAt(index);
    }
    notifyListeners();
  }
}