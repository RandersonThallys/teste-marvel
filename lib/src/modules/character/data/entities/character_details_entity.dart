import 'package:code_hero/src/core/interactor/entities/character_entity.dart';

class CharacterDetailsEntity extends CharacterEntity {
  final String description;
  final List<String> comics;

  CharacterDetailsEntity({
    required super.id,
    required super.events,
    required super.series,
    required super.thumbnail,
    required super.name,
    required this.description,
    required this.comics,
  });
}
