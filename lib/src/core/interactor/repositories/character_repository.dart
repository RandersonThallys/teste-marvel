import 'package:code_hero/src/core/interactor/states/character_state.dart';
import 'package:code_hero/src/modules/character/interactor/states/character_details_page_state.dart';

abstract interface class CharacterRepository {
  Future<ListCharacterState> getCharacter({int offSet, String? name});
  Future<CharacterDetailsPageState> getCharacterDetails({required int id});
}
