import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/src/core/entities/character_entity.dart';

void main() {
  group('Character', () {
    final characterMap = {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth (C-137)",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Citadel of Ricks",
        "url": "https://rickandmortyapi.com/api/location/3"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2"
      ],
      "url": "https://rickandmortyapi.com/api/character/1",
      "created": "2017-11-04T18:48:46.250Z"
    };

    test('fromMap should create a valid Character instance', () {
      final character = Character.fromMap(characterMap);

      expect(character.id, 1);
      expect(character.name, "Rick Sanchez");
      expect(character.status, "Alive");
      expect(character.species, "Human");
      expect(character.type, "");
      expect(character.gender, "Male");
      expect(character.origin.name, "Earth (C-137)");
      expect(character.origin.url, "https://rickandmortyapi.com/api/location/1");
      expect(character.location.name, "Citadel of Ricks");
      expect(character.location.url, "https://rickandmortyapi.com/api/location/3");
      expect(character.image, "https://rickandmortyapi.com/api/character/avatar/1.jpeg");
      expect(character.episode.length, 2);
      expect(character.url, "https://rickandmortyapi.com/api/character/1");
      expect(character.created, "2017-11-04T18:48:46.250Z");
    });

    test('toMap should return a valid Map', () {
      final character = Character.fromMap(characterMap);
      final map = character.toMap();

      expect(map, characterMap);
    });
  });
}