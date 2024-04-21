import 'package:code_hero/src/core/interactor/entities/serie_entity.dart';

class SerieAdapter {
  static SerieEntity fromMap(Map map) {
    return SerieEntity(name: map['name']);
  }

  static Map<String, dynamic> toMap(SerieEntity serieEntity) {
    return {'name': serieEntity.name};
  }
}
