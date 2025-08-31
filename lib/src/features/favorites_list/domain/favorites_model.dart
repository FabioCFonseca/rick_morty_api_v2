// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: hash_and_equals

// Todos os domínios são iguais nas diferentes soluções de state management
// tanto a interface do repositório quanto o model permitindo o re uso do código
// devido ao desacoplamento

import 'package:rick_morty_flutter/src/common/domain/i_card_model.dart';

class FavoritesModel implements ICardModel {
  final int id;
  final String name;
  final String image;

  const FavoritesModel({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  String toString() => 'Character name: $name';

  // Método para verificar a equalidade dos objetos para a funcionalidade
  // de toggle nos favoritos
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FavoritesModel) return false;
    return name == other.name && image == other.image;
  }
}