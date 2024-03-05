import 'package:rick_morty_flutter/src/features/characters_list/domain/character_model.dart';

class CharacterRepositoryMock {
  static List<CharacterModel> getCharacters() {
    final characters = [
      CharacterModel(id: 1, name: 'Rick Sanchez', image: 'rick_image_url'),
      CharacterModel(id: 2, name: 'Morty Smith', image: 'morty_image_url'),
      CharacterModel(id: 3, name: 'Summer Smith', image: 'summer_image_url'),
    ];

    return (characters);
  }
}
