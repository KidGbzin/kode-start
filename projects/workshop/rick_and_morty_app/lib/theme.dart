import 'package:flutter/material.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1C1B1F),
    toolbarHeight: 130,
  ),
  scaffoldBackgroundColor: const Color(0x00000000),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder> {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(), // Eu particularmente gosto da transição do Android O.
    }, 
  ),
);