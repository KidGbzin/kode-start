import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rickandmorty/src/core/entities/character_entity.dart';
import 'package:rickandmorty/src/services/rick_and_morty_service.dart';

class MockDio extends Mock implements Dio {}
class FakeRequestOptions extends Fake implements RequestOptions {}
class MockResponse extends Mock implements Response {}

void main() {
  late RickAndMortyService service;
  late MockDio mockDio;

  setUpAll(() {
    registerFallbackValue(FakeRequestOptions());
  });

  setUp(() {
    mockDio = MockDio();
    service = RickAndMortyService(mockDio);
  });

  group('getCharactersFromEndpoint', () {
    const endpoint = 'https://rickandmortyapi.com/api/character';

    test('return character list and next page', () async {
      final mockData = {
        'info': {'next': 'nextPageUrl'},
        'results': [
          {
            'id': 1,
            'name': 'Rick Sanchez',
            'status': 'Alive',
            'species': 'Human',
            'type': '',
            'gender': 'Male',
            'origin': {'name': 'Earth', 'url': ''},
            'location': {'name': 'Earth', 'url': ''},
            'image': 'imageUrl',
            'episode': [],
            'url': '',
            'created': '',
          }
        ]
      };

      when(() => mockDio.get(endpoint)).thenAnswer(
        (_) async => Response(
          data: mockData,
          statusCode: 200,
          requestOptions: RequestOptions(path: endpoint),
        ),
      );

      final result = await service.getCharactersFromEndpoint(endpoint);

      expect(result.characters, isA<List<Character>>());
      expect(result.characters.first.name, equals('Rick Sanchez'));
      expect(result.nextPage, equals('nextPageUrl'));
    });

    test('throw 404', () async {
      when(() => mockDio.get(endpoint)).thenThrow(
        DioException(
          type: DioExceptionType.badResponse,
          response: Response(
            statusCode: 404,
            requestOptions: RequestOptions(path: endpoint),
          ),
          requestOptions: RequestOptions(path: endpoint),
        ),
      );

      expect(
        () async => await service.getCharactersFromEndpoint(endpoint),
        throwsA(isA<Exception>().having((e) => e.toString(), 'mensagem', contains('No characters found'))),
      );
    });

    test('throw timeout', () async {
      when(() => mockDio.get(endpoint)).thenThrow(
        DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(path: endpoint),
        ),
      );

      expect(
        () async => await service.getCharactersFromEndpoint(endpoint),
        throwsA(isA<Exception>().having((e) => e.toString(), 'mensagem', contains('Connection timeout'))),
      );
    });

    test('throw unknown', () async {
      when(() => mockDio.get(endpoint)).thenThrow(Exception('Falha inesperada'));

      expect(
        () async => await service.getCharactersFromEndpoint(endpoint),
        throwsA(isA<Exception>().having((e) => e.toString(), 'mensagem', contains('Erro desconhecido'))),
      );
    });
  });

  group('getEpisodeName', () {
    const url = 'https://rickandmortyapi.com/api/episode/1';

    test('return episode name', () async {
      when(() => mockDio.get(url)).thenAnswer(
        (_) async => Response(
          data: {'name': 'Pilot'},
          statusCode: 200,
          requestOptions: RequestOptions(path: url),
        ),
      );

      final name = await service.getEpisodeName(url);

      expect(name, equals('Pilot'));
    });
  });
}
