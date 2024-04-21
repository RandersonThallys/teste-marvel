import 'package:code_hero/src/modules/home/interactor/state/home_state.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase();

  @observable
  HomeState state = InitHomeState();

  @observable
  int index = 0;

  @observable
  int listLenght = 3;

  @observable
  bool isHoveredContentTable = false;

  @action
  void changeHover() {
    isHoveredContentTable = !isHoveredContentTable;
  }

  @action
  void next() {
    index = index + 1;
  }

  @action
  void previous() {
    if (index != 0) {
      index = index - 1;
    }
  }
}
