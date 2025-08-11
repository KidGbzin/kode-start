import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'src/core/entities/character_entity.dart';
import 'src/presenter/details/details_handler.dart';
import 'src/presenter/favorites/favorites_handler.dart';
import 'src/presenter/home/home_handler.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

final GoRouter router = GoRouter(
  initialLocation: '/home',
  observers: <NavigatorObserver> [routeObserver],
  routes: <RouteBase> [
    GoRoute(
      path: '/home',
      builder: (BuildContext _, GoRouterState _) => const Home(),
    ),
    GoRoute(
      path: '/details',
      builder: (BuildContext _, GoRouterState state) => Details(state.extra as Character),
    ),
    GoRoute(
      path: '/favorites',
      builder: (BuildContext _, GoRouterState _) => const Favorites(),
    ),
  ]
);