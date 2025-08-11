part of '../favorites_handler.dart';

class _CharactersList extends StatefulWidget {

  final _FavoritesController controller;
  
  const _CharactersList(this.controller);

  @override
  State<_CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<_CharactersList> {
  late final List<Character> favorites = widget.controller.favorites;

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Text(
          "You don't have any favorite characters yet.",
          style: Typography().kobe.black,
        ),
      );
    }

    return ListView.separated(
      itemCount: favorites.length,
      itemBuilder: (BuildContext _, int index) => _CharacterTile(favorites[index]),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      separatorBuilder: (BuildContext _, int _) {
        return const Divider(
          height: 16,
          color: Colors.transparent,
        );
      }
    );
  }
}