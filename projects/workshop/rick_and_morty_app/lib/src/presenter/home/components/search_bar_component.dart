part of '../home_handler.dart';

class _SearchBar extends StatefulWidget {

  final _HomeController controller;

  const _SearchBar(this.controller);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final TextEditingController textController = TextEditingController();
  Timer? debounce;

  @override
  void dispose() {
    debounce?.cancel();
    textController.dispose();

    super.dispose();
  }

  // Debounce pra ter um pequeno delay na pesquisa pra nao dar overload de requisicoes a cada caractere.
  void onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(const Duration(milliseconds: 1000), () {
      widget.controller.fetchCharacters(query: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      child: TextField(
        controller: textController,
        style: Typography().kobe.regular,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: 'Buscar personagens...',
          hintStyle: Typography().kobe.regular,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: onSearchChanged,
      ),
    );
  }
}