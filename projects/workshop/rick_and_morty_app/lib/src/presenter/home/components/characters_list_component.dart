part of '../home_handler.dart';

class _CharactersList extends StatefulWidget {

  final _HomeController controller;
  
  const _CharactersList(this.controller);

  @override
  State<_CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<_CharactersList> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.nListState,
      builder: (
        BuildContext _,
        ({List<Character> characters, Object? error, String? nextPage, bool isLoading}) record,
        Widget? _,
      ) {
        if (record.error != null) {
          return Center(
            child: Text(
              record.error.toString(),
              style: Typography().kobe.black,
            ),
          );
        }

        if (record.characters.isEmpty) {
          if (record.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.controller.fetchCharacters();
          });

          return Center(
            child: Text(
              "Não tem nenhum personagem a ser mostrado, cheque os filtros de pesquisa.",
              style: Typography().kobe.black,
            ),
          );
        }

        return ListView.separated(
          itemCount: record.characters.length,
          itemBuilder: (BuildContext _, int index) {
            if (index == record.characters.length - 1 && record.nextPage != null && !record.isLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                widget.controller.fetchCharacters(
                  page: record.nextPage,
                );
              });

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            }

            return _CharacterTile(record.characters[index]);
          },
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          separatorBuilder: (BuildContext _, int _) {
            return const Divider(
              height: 16,
              color: Colors.transparent,
            );
          }
        );
      }
    );
  }
}