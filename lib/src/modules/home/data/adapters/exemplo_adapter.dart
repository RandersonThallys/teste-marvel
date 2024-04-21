import 'package:code_hero/src/modules/home/data/entities/exemplo_entity.dart';

class ExemploAdapter {
  static ExemploEntity fromMap(Map map) => ExemploEntity(name: map['name']);
  static Map toMap(ExemploEntity exemplo) => {'name': exemplo.name};
}
