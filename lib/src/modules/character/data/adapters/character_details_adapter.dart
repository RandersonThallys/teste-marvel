import 'package:code_hero/src/core/data/adapters/event_adapter.dart';
import 'package:code_hero/src/core/data/adapters/serie_adapter.dart';
import 'package:code_hero/src/core/data/adapters/thumbnail_adapter.dart';
import 'package:code_hero/src/modules/character/data/entities/character_details_entity.dart';

class CharacterDetailsAdapter {
  static CharacterDetailsEntity fromMap(Map map) {
    return CharacterDetailsEntity(
      id: map['id'],
      name: map['name'],
      series: List<dynamic>.from(map['series']['items'])
          .map((e) => SerieAdapter.fromMap(e))
          .toList(),
      events: List<dynamic>.from(map['events']['items'])
          .map((e) => EventAdapter.fromMap(e))
          .toList(),
      thumbnail: ThumbnailAdapter.fromMap(map['thumbnail']),
      description: map['description'],
      comics: List<Map>.from(map['comics']['items'])
          .map((e) => e['name'] as String)
          .toList(),
    );
  }
}
