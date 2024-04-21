// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:code_hero/src/modules/character/interactor/states/character_details_page_state.dart';
import 'package:mobx/mobx.dart';

import 'package:code_hero/src/core/interactor/repositories/character_repository.dart';

part 'character_details_store.g.dart';

class CharacterDetailsStore = CharacterDetailsStoreBase
    with _$CharacterDetailsStore;

abstract class CharacterDetailsStoreBase with Store {
  final CharacterRepository characterRepository;
  CharacterDetailsStoreBase({
    required this.characterRepository,
  });

  @observable
  CharacterDetailsPageState state = InitCharacterDetailsPageState();

  @action
  Future<void> getCharacterDetails({required int id}) async {
    state = state.loading();
    state = await characterRepository.getCharacterDetails(id: id);
  }
}
