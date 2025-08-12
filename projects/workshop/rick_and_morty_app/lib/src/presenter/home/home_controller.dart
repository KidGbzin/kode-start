part of 'home_handler.dart';

class _HomeController {

  final RickAndMortyService rickAndMortyService;

  _HomeController({
    required this.rickAndMortyService,
  });

  BaseEndpoints endpoint = BaseEndpoints.characters;

  /// Notifier para atualizar a lista de personagens.
  /// Foi utilizado um record pois qualquer mudanca em um dos parametros
  /// vai notificar os listenes de forma reativa.
  ValueNotifier<({
    List<Character> characters,
    Object? error,
    String? nextPage,
    bool isLoading,
  })> nListState = ValueNotifier((
    characters: <Character> [],
    error: null,
    nextPage: null,
    isLoading: false,
  ));

  // Essa funcao vai atualizar o endpoint e limpar a lista de personagens para o novo endpoint.
  // Usado no drawer lateral.
  Future<void> updateEndpoint(BaseEndpoints baseEndpoint) async {
    endpoint = baseEndpoint;

    nListState.value = (
      characters: <Character> [],
      error: null,
      nextPage: null,
      isLoading: false,
    );
    
    fetchCharacters();
  }

  /// Atualiza [nListState] com os personagens ou da proxima pagina, query ou com o endpoint novo.
  Future<void> fetchCharacters({String? query, String? page}) async {
    assert(query == null || page == null);

    try {
      nListState.value = (
        characters: nListState.value.characters,
        error: null,
        nextPage: null,
        isLoading: true,
      );

      late final ({
        List<Character> characters,
        String? nextPage,
      }) response;

      // Se a query nao for nula, ele vai pegar os personagens da query e atualizar a lista como nova.
      if (query != null) {
        endpoint = BaseEndpoints.characters;
        response = await rickAndMortyService.getCharactersFromEndpoint('${endpoint.path}/?name=$query');

        nListState.value = (
          characters: response.characters,
          nextPage: response.nextPage,
          error: null,
          isLoading: false,
        );

        return;
      }

      // Se a pagina nao for nula, ele vai pegar os personagens da paginacao e agregar a lista.
      if (page != null) {
        response = await rickAndMortyService.getCharactersFromEndpoint(page);

        nListState.value = (
          characters: nListState.value.characters + response.characters,
          nextPage: response.nextPage,
          error: null,
          isLoading: false,
        );

        return;
      }

      // Se a pagina for nula, ele vai pegar os personagens do endpoint e atualizar a lista como nova.
      response = await rickAndMortyService.getCharactersFromEndpoint(endpoint.path);

      nListState.value = (
        characters: response.characters,
        nextPage: response.nextPage,
        error: null,
        isLoading: false,
      );
    }
    catch (error) {
      nListState.value = (
        characters: <Character> [],
        error: error,
        nextPage: null,
        isLoading: false,
      );
    }
  }
}
