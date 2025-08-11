import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../entities/character_entity.dart';

/// Uma extenão para facilitar a navegação entre as telas.
/// 
/// Organizando em um só local, a navegação pode ser chamada diretamente
/// pelo contexto assim: `context.goToDetails(character)`.
extension RouteExtension on BuildContext {
  
  void goToDetails(Character character) {
    push(
      '/details',
      extra: character,
    );
  }

  void goToHome() {
    push('/home');
  }

  void goToFavorites() {
    push('/favorites');
  }
}