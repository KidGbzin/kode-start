import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/logger.dart';
import 'package:rickandmorty/src/core/extensions/route_extension.dart';
import 'package:rickandmorty/src/core/extensions/typography_extension.dart';
import 'package:rickandmorty/src/services/rick_and_morty_service.dart';

import '../../core/entities/character_entity.dart';

part 'components/search_bar_component.dart';
part 'components/character_tile_component.dart';
part 'components/characters_list_component.dart';
part 'components/drawer_component.dart';

part 'home_controller.dart';
part 'home_view.dart';

class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final _HomeController controller;

  late final RickAndMortyService rickAndMortyService;

  @override
  void initState() {
    super.initState();

    Logger.start('Home initialized');

    rickAndMortyService = Provider.of<RickAndMortyService>(
      context,
      listen: false,
    );

    controller = _HomeController(
      rickAndMortyService: rickAndMortyService,
    );
  }

  @override
  void dispose() {
    Logger.trash('Home disposed');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _HomeView(controller);
  }
}
