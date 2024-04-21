// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:code_hero/src/core/interactor/repositories/character_repository.dart';
import 'package:code_hero/src/core/interactor/states/character_state.dart';

part 'character_store.g.dart';

class CharacterStore = CharacterStoreBase with _$CharacterStore;

abstract class CharacterStoreBase with Store {
  final CharacterRepository characterRepository;
  CharacterStoreBase({
    required this.characterRepository,
  });

  @observable
  ListCharacterState state = InitListCharacterState();

  @observable
  int offset = 0;

  @observable
  int index = 0;

  @observable
  int limitPages = 0;

  TextEditingController controller = TextEditingController();

  @action
  nextOffset() {
    offset += 4;
    index += 1;
  }

  @action
  previousOffset() {
    if (offset != 0) {
      offset -= 4;
      index -= 1;
    }
  }

  @action
  pageIndexSelected(int index) {
    offset = index * 4;
    this.index = index;
  }

  @action
  Future<void> getCharacters() async {
    state = state.loading();
    state = await characterRepository.getCharacter(
        offSet: offset, name: controller.text.isEmpty ? null : controller.text);
  }
}
