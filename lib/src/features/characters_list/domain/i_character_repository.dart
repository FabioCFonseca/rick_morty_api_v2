import 'package:dartz/dartz.dart';
import 'package:rick_morty_flutter/src/common/domain/app_error.dart';

import 'package:rick_morty_flutter/src/features/characters_list/domain/character_model.dart';

// Interface para abstrair a implementação do repositório/API da camada de domínio
abstract class ICharacterRepository {
  Future<Either<AppError, List<CharacterModel>>> getCharacters();
}