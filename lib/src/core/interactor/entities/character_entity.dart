import 'package:code_hero/src/core/interactor/entities/event_entity.dart';
import 'package:code_hero/src/core/interactor/entities/serie_entity.dart';
import 'package:code_hero/src/core/interactor/entities/thumbnail_entity.dart';

class CharacterEntity {
  final int id;
  final String name;
  final ThumbnailEntity thumbnail;
  final List<SerieEntity> series;
  final List<EventEntity> events;
  CharacterEntity({
    required this.id,
    required this.name,
    required this.events,
    required this.series,
    required this.thumbnail,
  });
}
