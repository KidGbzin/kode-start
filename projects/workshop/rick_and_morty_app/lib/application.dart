import 'package:flutter/material.dart';
import 'package:rickandmorty/router.dart';
import 'package:rickandmorty/theme.dart';

class Application extends StatelessWidget {

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: theme,
    );
  }
}