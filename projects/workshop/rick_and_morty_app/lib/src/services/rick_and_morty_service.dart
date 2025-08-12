import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/logger.dart';
import 'package:rickandmorty/src/core/entities/character_entity.dart';

enum BaseEndpoints {
  characters(
    'All Characters',
    'https://rickandmortyapi.com/api/character',
    Icons.people,
  ),
  genderMale(
    'Male Characters',
    'https://rickandmortyapi.com/api/character/?gender=male',
    Icons.male,
  ),
  genderFemale(
    'Female Characters',
    'https://rickandmortyapi.com/api/character/?gender=female',
    Icons.female,
  ),
  genderGenderless(
    'Genderless Characters',
    'https://rickandmortyapi.com/api/character/?gender=genderless',
    Icons.transgender,
  ),
  genderUnknown(
    'Gender Unknown',
    'https://rickandmortyapi.com/api/character/?gender=unknown',
    Icons.help_outline,
  ),
  statusAlive(
    'Alive Characters',
    'https://rickandmortyapi.com/api/character/?status=alive',
    Icons.favorite,
  ),
  statusDead(
    'Dead Characters',
    'https://rickandmortyapi.com/api/character/?status=dead',
    Icons.close,
  ),
  statusUnknown(
    'Status Unknown',
    'https://rickandmortyapi.com/api/character/?status=unknown',
    Icons.help_outline,
  );

  final String title;
  final String path;
  final IconData icon;

  const BaseEndpoints(this.title, this.path, this.icon);
}

class RickAndMortyService {

  final Dio dio;

  RickAndMortyService(this.dio);

  /// Essa funcao vai pegar os personagens da api, ela recebe um endopoint.
  /// Não usei o "base endpoint" do Dio pois eu ja posso pegar o link da paginacao
  /// da api sem fazer parse de string.
  Future<({List<Character> characters, String? nextPage})> getCharactersFromEndpoint(String endpoint) async {
    try {
      final Response response = await dio.get(endpoint);

      Logger.success('API Request success: ${response.statusCode}.');

      var info = response.data['info'];
      var results = response.data['results'];

      final List<Character> characters = List<Character>.from(results.map((e) => Character.fromMap(e)));
      final String? nextPage = info['next'];

      return (
        characters: characters,
        nextPage: nextPage,
      );
    } on DioException catch (e) {
      Logger.error('API Request error: ${e.message}.');

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception('Connection timeout.');
      } else if (e.type == DioExceptionType.badResponse) {
        final statusCode = e.response?.statusCode;
        if (statusCode == 404) {
          throw Exception('No characters found.');
        } else {
          throw Exception('Server error: $statusCode.');
        }
      } else if (e.type == DioExceptionType.cancel) {
        throw Exception('Request canceled.');
      } else if (e.type == DioExceptionType.unknown) {
        throw Exception('Unknown error: ${e.message}');
      } else {
        throw Exception('Uncatched Dio error: ${e.message}');
      }
    }
    catch (e) {
      Logger.error('API unknown error: $e.');

      throw Exception('Unknown error: $e');
    }
  }

  /// Essa funcao vai pegar o nome do episodio da api.
  /// Não fiz a verificacao de erro aqui, pois é um projeto pequeno
  /// E no widget tem uma descricao generico em caso de erro.
  /// Pode ser melhorado no futuro.
  Future<String> getEpisodeName(String url) async {
    final Response response = await dio.get(url);

    return response.data['name'];
  }
}
