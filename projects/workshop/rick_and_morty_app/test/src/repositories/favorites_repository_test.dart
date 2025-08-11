import 'package:flutter_test/flutter_test.dart';
import 'package:rickandmorty/src/core/entities/character_entity.dart';
import 'package:rickandmorty/src/core/entities/location_info_entity.dart';
import 'package:rickandmorty/src/repositories/favorites_repository.dart';

void main() {
  group('FavoritesRepository', () {
    late FavoritesRepository repository;
    late Character characterA;
    late Character characterB;

    setUp(() {
      repository = FavoritesRepository();
      characterA = Character(
        id: 1,
        name: 'Hero A',
        status: 'Alive',
        species: 'Human',
        gender: 'Male',
        type: '',
        image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
        episode: ['https://rickandmortyapi.com/api/episode/1'],
        url: 'https://rickandmortyapi.com/api/character/1',
        created: '2017-11-04T18:48:46.250Z',
        origin: LocationInfo(name: 'Earth', url: 'https://rickandmortyapi.com/api/location/1'),
        location: LocationInfo(name: 'Citadel of Ricks', url: 'https://rickandmortyapi.com/api/location/3'),
      );
      characterB = Character(
        id: 2,
        name: 'Hero B',
        status: 'Alive',
        species: 'Human',
        gender: 'Male',
        type: '',
        image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
        episode: ['https://rickandmortyapi.com/api/episode/1'],
        url: 'https://rickandmortyapi.com/api/character/1',
        created: '2017-11-04T18:48:46.250Z',
        origin: LocationInfo(name: 'Earth', url: 'https://rickandmortyapi.com/api/location/1'),
        location: LocationInfo(name: 'Citadel of Ricks', url: 'https://rickandmortyapi.com/api/location/3'),
      );
    });

    test('add character to favorites', () {
      final result = repository.toggleFavorite(characterA);

      expect(result, isTrue);
      expect(repository.favorites, contains(characterA));
    });

    test('remove character from favorites', () {
      repository.toggleFavorite(characterA);
      final result = repository.toggleFavorite(characterA);

      expect(result, isFalse);
      expect(repository.favorites, isNot(contains(characterA)));
    });

    test('deve lidar com múltiplos personagens', () {
      repository.toggleFavorite(characterA);
      repository.toggleFavorite(characterB);

      expect(repository.favorites, containsAll([characterA, characterB]));
    });

    test('init list must be empty', () {
      expect(repository.favorites, isEmpty);
    });
  });
}