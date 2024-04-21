import 'package:code_hero/src/core/interactor/entities/character_entity.dart';

sealed class ListCharacterState {
  final List<CharacterEntity> characters;
  final int totalResult;
  ListCharacterState({required this.characters, required this.totalResult});

  InitListCharacterState init() {
    return InitListCharacterState();
  }

  ErrorListCharacterState error({required String message}) {
    return ErrorListCharacterState(
        message: message, characters: characters, totalResult: totalResult);
  }

  SuccessListCharacterState success(
      {List<CharacterEntity>? characters, int? totalResult}) {
    return SuccessListCharacterState(
        characters: characters ?? this.characters,
        totalResult: totalResult ?? this.totalResult);
  }

  LoadingListCharacterState loading(
      {List<CharacterEntity>? characters, int? totalResult}) {
    return LoadingListCharacterState(
        characters: characters ?? this.characters,
        totalResult: totalResult ?? this.totalResult);
  }
}

class SuccessListCharacterState extends ListCharacterState {
  SuccessListCharacterState(
      {required super.characters, required super.totalResult});
}

class LoadingListCharacterState extends ListCharacterState {
  LoadingListCharacterState(
      {required super.characters, required super.totalResult});
}

class InitListCharacterState extends ListCharacterState {
  InitListCharacterState() : super(characters: [], totalResult: 0);
}

class ErrorListCharacterState extends ListCharacterState {
  final String message;
  ErrorListCharacterState(
      {required this.message,
      required super.characters,
      required super.totalResult});
}
