import 'package:code_hero/src/core/core_module.dart';
import 'package:code_hero/src/core/data/repositories/character_repository_impl.dart';
import 'package:code_hero/src/core/interactor/repositories/character_repository.dart';
import 'package:code_hero/src/modules/character/interactor/character_details_store.dart';
import 'package:code_hero/src/modules/character/ui/pages/character_details_page.dart';
import 'package:code_hero/src/modules/home/interactor/stories/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterModule extends Module {
  @override
  // TODO: implement imports
  List<Module> get imports => [CoreModule()];
  @override
  void binds(i) {
    i.addLazySingleton<CharacterRepository>(CharacterRepositoryImpl.new);
    i.addLazySingleton(CharacterDetailsStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/character-details',
      child: (context) => const CharacterDetailsPage(),
    );
  }
}
