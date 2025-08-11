import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/src/repositories/favorites_repository.dart';
import 'package:rickandmorty/src/services/rick_and_morty_service.dart';

import '../../../logger.dart';
import '../../core/entities/character_entity.dart';
import '../../core/extensions/typography_extension.dart';

part 'components/card_details_component.dart';
part 'components/heart_button_component.dart';

part 'details_controller.dart';
part 'details_view.dart';

class Details extends StatefulWidget {

  final Character character;

  const Details(this.character, {super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late final _DetailsController controller;
  late final RickAndMortyService rickAndMortyService;
  late final FavoritesRepository favoritesRepository;

  @override
  void initState() {
    super.initState();

    Logger.start('Details initialized');

    rickAndMortyService = Provider.of<RickAndMortyService>(
      context,
      listen: false,
    );

    favoritesRepository = Provider.of<FavoritesRepository>(
      context,
      listen: false,
    );

    controller = _DetailsController(
      character: widget.character,
      rickAndMortyService: rickAndMortyService,
      favoritesRepository: favoritesRepository,
    )..initialize();
  }

  @override
  void dispose() {
    controller.dispose();

    Logger.trash('Details disposed');

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return _DetailsView(controller);
  }
}