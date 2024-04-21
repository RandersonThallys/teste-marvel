import 'package:code_hero/src/core/core_module.dart';
import 'package:code_hero/src/modules/character/character_module.dart';
import 'package:code_hero/src/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [CoreModule()];

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/character', module: CharacterModule());
  }
}
