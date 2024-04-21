import 'package:code_hero/src/modules/home/interactor/state/home_state.dart';

abstract class HomeRepository {
  Future<HomeState> loadHomeContent();
}
