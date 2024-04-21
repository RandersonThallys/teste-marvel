import 'dart:convert';

import 'package:code_hero/src/core/data/adapters/character_adapter.dart';
import 'package:code_hero/src/core/data/services/http/http_service.dart';
import 'package:code_hero/src/core/interactor/entities/event_entity.dart';
import 'package:code_hero/src/core/interactor/entities/character_entity.dart';
import 'package:code_hero/src/core/interactor/entities/serie_entity.dart';
import 'package:code_hero/src/core/interactor/entities/thumbnail_entity.dart';
import 'package:code_hero/src/core/interactor/repositories/character_repository.dart';
import 'package:code_hero/src/core/interactor/states/character_state.dart';
import 'package:code_hero/src/modules/character/data/adapters/character_details_adapter.dart';
import 'package:code_hero/src/modules/character/data/entities/character_details_entity.dart';
import 'package:code_hero/src/modules/character/interactor/states/character_details_page_state.dart';
import 'package:crypto/crypto.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final HttpService http;
  late String hash;
  late String apiKey;
  late String baseUrl;
  CharacterRepositoryImpl({
    required this.http,
  }) {
    baseUrl = 'https://gateway.marvel.com:443/v1/public/';
    apiKey = 'e68fcdb3b2646a654932574f3988e123';
    hash = md5
        .convert(utf8.encode(
            '1357b9f777d4beb533dafac3f5ac89c7e559841a3e68fcdb3b2646a654932574f3988e123'))
        .toString();
  }

  @override
  Future<ListCharacterState> getCharacter(
      {int offSet = 0, String? name}) async {
    final response =
        await http.get(url: '${baseUrl}characters', queryParameters: {
      'limit': '4',
      'offset': offSet.toString(),
      'apikey': apiKey,
      'ts': '1',
      'hash': hash,
      if (name != null) 'name': name,
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      if (body.isNotEmpty) {
        List result = body['data']['results'];
        int totalResult = body['data']['total'];

        List<CharacterEntity> characters = result
            .map(
              (map) => CharacterAdapter.fromMap(map),
            )
            .toList();

        return SuccessListCharacterState(
            characters: characters, totalResult: totalResult);
      } else {
        return ErrorListCharacterState(
          message: 'Não foi possivel carregar os personagens',
          characters: [],
          totalResult: 0,
        );
      }
    } else {
      return ErrorListCharacterState(
          message: 'Não foi possivel carregar os personagens',
          characters: [],
          totalResult: 0);
    }
  }

  @override
  Future<CharacterDetailsPageState> getCharacterDetails(
      {required int id}) async {
    final response = await http.get(
        url: '${baseUrl}characters/$id',
        queryParameters: {'apikey': apiKey, 'ts': '1', 'hash': hash});

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      if (body.isNotEmpty) {
        List result = body['data']['results'];

        CharacterDetailsEntity character =
            CharacterDetailsAdapter.fromMap(result.first);

        return SuccessCharacterDetailsPageState(character: character);
      } else {
        return ErrorCharacterDetailsPageState(
          message: 'Não foi possivel carregar os personagens',
          character: CharacterDetailsEntity(
              id: 0,
              events: [],
              series: [],
              thumbnail: ThumbnailEntity(path: '', extension: ''),
              name: '',
              description: '',
              comics: []),
        );
      }
    } else {
      return ErrorCharacterDetailsPageState(
        message: 'Não foi possivel carregar os personagens',
        character: CharacterDetailsEntity(
            id: 0,
            events: [],
            series: [],
            thumbnail: ThumbnailEntity(path: '', extension: ''),
            name: '',
            description: '',
            comics: []),
      );
    }
  }
}
