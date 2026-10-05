import 'package:flutter/material.dart';

import '../../data/models/info_page.dart';
import '../../data/models/recipe.dart';
import '../../data/repositories/info_repository.dart';
import '../../data/repositories/recipe_repository.dart';
import '../../ui/viewmodels/home_view_model.dart';
import '../../ui/viewmodels/info_view_model.dart';
import '../../ui/viewmodels/recipe_detail_view_model.dart';
import '../../ui/views/home_view.dart';
import '../../ui/views/info_view.dart';
import '../../ui/views/recipe_detail_view.dart';

/// Nomes das rotas do aplicativo.
abstract final class AppRoutes {
  static const home = '/';
  static const recipeDetail = '/receita';
  static const info = '/info';
}

/// Cria as telas e injeta seus ViewModels.
class AppRouter {
  AppRouter({
    required RecipeRepository recipeRepository,
    required InfoRepository infoRepository,
  })  : _recipeRepository = recipeRepository,
        _infoRepository = infoRepository;

  final RecipeRepository _recipeRepository;
  final InfoRepository _infoRepository;

  /// Resolve a rota pedida para a tela correspondente.
  Route<void> onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      AppRoutes.recipeDetail => RecipeDetailView(
          viewModel: RecipeDetailViewModel(settings.arguments! as Recipe),
        ),
      AppRoutes.info => InfoView(
          viewModel: InfoViewModel(
            repository: _infoRepository,
            type: settings.arguments! as InfoPageType,
          ),
        ),
      _ => HomeView(
          viewModel: HomeViewModel(repository: _recipeRepository),
        ),
    };

    return MaterialPageRoute(settings: settings, builder: (_) => page);
  }
}
