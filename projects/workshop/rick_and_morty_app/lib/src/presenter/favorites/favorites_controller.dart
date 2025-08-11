part of 'favorites_handler.dart';

class _FavoritesController {

  final FavoritesRepository favoritesRepository;

  _FavoritesController(this.favoritesRepository);

  List<Character> get favorites => favoritesRepository.favorites;
}