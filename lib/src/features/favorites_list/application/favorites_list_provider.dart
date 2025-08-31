import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/common/domain/i_card_model.dart';

import 'package:rick_morty_flutter/src/utils/user_preferences.dart';

class FavoritesListProvider extends ChangeNotifier {
  List<ICardModel> favoriteCharacters = [];

  //TOGGLE FUNCTIONALITY
  void toggleFavorite(ICardModel character) {
    final index = favoriteCharacters.indexOf(character);
    if (index == -1) {
      favoriteCharacters.add(character);
      UserPreferences.saveFavoriteCharactersToSharedPrefs(
        '${character.id.toString()}',
      );
    } else {
      favoriteCharacters.removeAt(index);
      UserPreferences.removeFavoriteCharactersToSharedPrefs(
        '${character.id.toString()}',
      );
    }
    notifyListeners();
  }
}