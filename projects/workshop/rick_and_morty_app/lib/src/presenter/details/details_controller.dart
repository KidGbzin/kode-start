part of 'details_handler.dart';

class _DetailsController {

  final Character character;

  final RickAndMortyService rickAndMortyService;

  final FavoritesRepository favoritesRepository;

  _DetailsController({
    required this.character,
    required this.rickAndMortyService,
    required this.favoritesRepository,
  });

  Future<void> initialize() async {
    nIsFavorite.value = isFavorite();

    fetchEpisodeName();
  }

  void dispose() => nEpisodeName.dispose();

  /// Notifier para o nome do episodio.
  /// Usado no [_CardDetails].
  ValueNotifier<String> nEpisodeName = ValueNotifier('Loading...');

  /// Notifier para saber se o personagem eh favorito ou nao.
  /// Usado no [_HeartButton].
  ValueNotifier<bool> nIsFavorite = ValueNotifier(false);

  Future<void> fetchEpisodeName() async {
    try {
      nEpisodeName.value = await rickAndMortyService.getEpisodeName(character.episode.first);
    }
    catch (error) {
      debugPrint(error.toString());

      nEpisodeName.value = 'Unable to find episode name.';
    }
  }

  bool isFavorite() => favoritesRepository.favorites.contains(character);

  void toggleFavorite() {
    nIsFavorite.value = favoritesRepository.toggleFavorite(character);
  }
}