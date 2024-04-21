import 'package:code_hero/src/core/interactor/entities/event_entity.dart';

class EventAdapter {
  static EventEntity fromMap(Map map) {
    return EventEntity(
      name: map['name'],
    );
  }

  static Map<String, dynamic> toMap(EventEntity eventEntity) {
    return {'name': eventEntity.name};
  }
}
