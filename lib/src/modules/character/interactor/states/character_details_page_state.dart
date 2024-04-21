
import 'package:code_hero/src/core/interactor/entities/thumbnail_entity.dart';
import 'package:code_hero/src/modules/character/data/entities/character_details_entity.dart';

sealed class CharacterDetailsPageState {
  final CharacterDetailsEntity character;
  CharacterDetailsPageState({required this.character});

  InitCharacterDetailsPageState init() {
    return InitCharacterDetailsPageState();
  }

  ErrorCharacterDetailsPageState error({required String message}) {
    return ErrorCharacterDetailsPageState(
        message: message, character: character);
  }

  SuccessCharacterDetailsPageState success(
      {CharacterDetailsEntity? character}) {
    return SuccessCharacterDetailsPageState(
        character: character ?? this.character);
  }

  LoadingCharacterDetailsPageState loading(
      {CharacterDetailsEntity? character}) {
    return LoadingCharacterDetailsPageState(
        character: character ?? this.character);
  }
}

class SuccessCharacterDetailsPageState extends CharacterDetailsPageState {
  SuccessCharacterDetailsPageState({required super.character});
}

class LoadingCharacterDetailsPageState extends CharacterDetailsPageState {
  LoadingCharacterDetailsPageState({required super.character});
}

class InitCharacterDetailsPageState extends CharacterDetailsPageState {
  InitCharacterDetailsPageState()
      : super(
            character: CharacterDetailsEntity(
                id: 0,
                events: [],
                series: [],
                thumbnail: ThumbnailEntity(path: '', extension: ''),
                name: '',
                description: '',
                comics: []));
}

class ErrorCharacterDetailsPageState extends CharacterDetailsPageState {
  final String message;
  ErrorCharacterDetailsPageState(
      {required this.message, required super.character});
}
