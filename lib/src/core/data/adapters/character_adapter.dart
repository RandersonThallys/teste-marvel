import 'package:code_hero/src/core/data/adapters/event_adapter.dart';
import 'package:code_hero/src/core/data/adapters/serie_adapter.dart';
import 'package:code_hero/src/core/data/adapters/thumbnail_adapter.dart';
import 'package:code_hero/src/core/interactor/entities/character_entity.dart';

class CharacterAdapter {
  static CharacterEntity fromMap(Map map) {
    return CharacterEntity(
      id: map['id'],
      name: map['name'],
      series: List<dynamic>.from(map['series']['items'])
          .map((e) => SerieAdapter.fromMap(e))
          .toList(),
      events: List<dynamic>.from(map['events']['items'])
          .map((e) => EventAdapter.fromMap(e))
          .toList(),
      thumbnail: ThumbnailAdapter.fromMap(map['thumbnail']),
    );
  }

  static Map<String, dynamic> toMap(CharacterEntity characterEntity) {
    return {
      'name': characterEntity.name,
      
      'series': characterEntity.series
          .map((serie) => SerieAdapter.toMap(serie))
          .toList(),
      'events': characterEntity.events
          .map((event) => EventAdapter.toMap(event))
          .toList(),
      'thumbnail': ThumbnailAdapter.toMap(characterEntity.thumbnail),
    };
  }
}
