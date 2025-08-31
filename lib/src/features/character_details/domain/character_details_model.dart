// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// Todos os domínios são iguais nas diferentes soluções de state management
// tanto a interface do repositório quanto o model permitindo o re uso do código
// devido ao desacoplamento

class CharacterDetailModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String origin;
  final String image;

  CharacterDetailModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.image,
  });

  @override
  String toString() => 'Character details: $name, $id';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin,
      'image': image,
    };
  }

  factory CharacterDetailModel.fromMap(Map<String, dynamic> map) {
    return CharacterDetailModel(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      // ignore: avoid_dynamic_calls
      origin: map['origin']['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterDetailModel.fromJson(String source) =>
      CharacterDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}