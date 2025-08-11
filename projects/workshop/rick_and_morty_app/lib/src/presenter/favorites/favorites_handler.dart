import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/src/core/extensions/route_extension.dart';
import 'package:rickandmorty/src/core/extensions/typography_extension.dart';

import '../../../logger.dart';
import '../../core/entities/character_entity.dart';
import '../../repositories/favorites_repository.dart';

part 'components/favorite_character_tile_component.dart';
part 'components/favorite_characters_list_component.dart';

part 'favorites_view.dart';
part 'favorites_controller.dart';

class Favorites extends StatefulWidget {

  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late final _FavoritesController controller;
  late final FavoritesRepository favoritesRepository;

  @override
  void initState() {
    super.initState();

    Logger.start('Favorites initialized');

    favoritesRepository = Provider.of<FavoritesRepository>(
      context,
      listen: false,
    );
    
    controller = _FavoritesController(favoritesRepository);
  }

  @override
  void dispose() {
    Logger.trash('Favorites disposed');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _View(controller);
  }
}