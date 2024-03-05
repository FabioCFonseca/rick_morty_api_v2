
import 'package:rick_morty_flutter/src/features/character_details/domain/character_details_model.dart';

class CharacterDetailsRepositoryMock  {
  static CharacterDetailModel getDetails() {
    final characterDetails = CharacterDetailModel(
      id: 1,
      name: 'Rick Sanchez',
      status: 'Alive',
      species: 'Human',
      type: 'Human with alcohol addiction',
      gender: 'Male',
      origin: 'Earth (C-137)',
      image: 'rick_image_url',
    );

    return (characterDetails);
  }
}
