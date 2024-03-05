import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'package:rick_morty_flutter/src/common/domain/app_error.dart';
import 'package:rick_morty_flutter/src/features/character_details/domain/character_details_model.dart';
import 'package:rick_morty_flutter/src/features/character_details/domain/i_character_details_repository.dart';

class CharactersDetailsRepository implements ICharacterDetailsRepository {
  @override
  Future<Either<AppError, CharacterDetailModel>> getDetails(
    int selectedCharacter,
  ) async {
    try {
      final url =
          Uri.https('rickandmortyapi.com', '/api/character/$selectedCharacter');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final parsedData = json.decode(response.body);
        final characterData = parsedData;

        // ignore: argument_type_not_assignable
        return Right(CharacterDetailModel.fromMap(characterData));
      } else {
        return Left(AppError(statusCode: response.statusCode));
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}