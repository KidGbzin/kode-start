import 'package:rickandmorty/src/core/entities/character_entity.dart';

class FavoritesRepository {

  FavoritesRepository();
  
  final List<Character> favorites = [];

  bool toggleFavorite(Character character) {
    if (favorites.contains(character)) {
      favorites.remove(character);

      return false;
    }
    else {
      favorites.add(character);

      return true;
    }
  }
}