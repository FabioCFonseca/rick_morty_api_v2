import 'package:flutter/material.dart';

import 'package:rick_morty_flutter/src/common/domain/app_error.dart';
import 'package:rick_morty_flutter/src/features/character_details/domain/character_details_model.dart';
import 'package:rick_morty_flutter/src/features/character_details/domain/i_character_details_repository.dart';

enum CharacterDetailsProviderState { loading, success, error }

class CharacterDetailsProvider extends ChangeNotifier {
  CharacterDetailsProvider({
    required this.selectedCharacter,
    required this.repository,
  });

  //REPOSITORY INSTANCE
  ICharacterDetailsRepository repository;
  int selectedCharacter;

  // MODELS FOR UI
  late CharacterDetailModel character;
  late AppError appError;

  //PROVIDER STATE
  late CharacterDetailsProviderState providerStatus;

  Future controllerStart() async {
    providerStatus = CharacterDetailsProviderState.loading;
    final result = await repository.getDetails(selectedCharacter);

    result.fold(
      (error) {
        appError = error;
        providerStatus = CharacterDetailsProviderState.error;
      },
      (success) {
        character = success;
        providerStatus = CharacterDetailsProviderState.success;
      },
    );
    notifyListeners();
  }
}