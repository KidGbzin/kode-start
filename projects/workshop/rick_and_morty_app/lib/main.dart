import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rickandmorty/logger.dart';
import 'package:rickandmorty/src/repositories/favorites_repository.dart';
import 'package:rickandmorty/src/services/rick_and_morty_service.dart';

import '../application.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    Logger.start('Application started');
  
    final Dio dio = Dio();

    final RickAndMortyService rickAndMortyService = RickAndMortyService(dio);
    final FavoritesRepository favoritesRepository = FavoritesRepository();

    runApp(
      MultiProvider(
        providers: <SingleChildWidget> [
          Provider<RickAndMortyService>.value(
            value: rickAndMortyService,
          ),
          Provider<FavoritesRepository>.value(
            value: favoritesRepository,
          ),
        ],
        child: const Application(),
      ),
    );
  },
  (error, stackTrace) {
    Logger.error(
      error.toString(),
      stackTrace: stackTrace,
    );
  });
}