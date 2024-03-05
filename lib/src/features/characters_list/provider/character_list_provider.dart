// ignore_for_file: unnecessary_string_interpolations, noop_primitive_operations

import 'package:flutter/material.dart';

import 'package:rick_morty_flutter/src/common/domain/app_error.dart';
import 'package:rick_morty_flutter/src/features/characters_list/domain/character_model.dart';
import 'package:rick_morty_flutter/src/features/characters_list/domain/i_character_repository.dart';
import 'package:rick_morty_flutter/src/features/favorites_list/application/favorites_list_provider.dart';
import 'package:rick_morty_flutter/src/utils/user_preferences.dart';

enum CharacterListProviderState { loading, success, error }

class CharacterListProvider extends ChangeNotifier {
  CharacterListProvider({required this.repository});

  //REPOSITORY INSTANCE
  final ICharacterRepository repository;

  // MODELS FOR UI
  List<CharacterModel> characters = [];
  late AppError appError;

  //PROVIDER STATE
  late CharacterListProviderState providerStatus;

  Future<void> controllerStart(BuildContext context) async {
    providerStatus = CharacterListProviderState.loading;
    final result = await repository.getCharacters();

    result.fold(
      (error) {
        appError = error;
        providerStatus = CharacterListProviderState.error;
      },
      (success) {
        characters = success;
        providerStatus = CharacterListProviderState.success;
      },
    );
    notifyListeners();
  }
}