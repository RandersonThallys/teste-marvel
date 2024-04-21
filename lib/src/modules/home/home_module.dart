import 'package:code_hero/src/core/core_module.dart';
import 'package:code_hero/src/core/data/repositories/character_repository_impl.dart';
import 'package:code_hero/src/core/data/services/http/http_service.dart';
import 'package:code_hero/src/core/data/services/http/http_service_impl.dart';
import 'package:code_hero/src/core/interactor/repositories/character_repository.dart';
import 'package:code_hero/src/core/interactor/stories/character_store.dart';
import 'package:code_hero/src/modules/home/interactor/stories/home_store.dart';
import 'package:code_hero/src/modules/home/ui/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(HomeStore.new);
    i.addLazySingleton(CharacterStore.new);
    i.addLazySingleton<CharacterRepository>(CharacterRepositoryImpl.new);
    i.add<HttpService>(HttpServiceImp.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const HomePage(),
    );
  }
}
