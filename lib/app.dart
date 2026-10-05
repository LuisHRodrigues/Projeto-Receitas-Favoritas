import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'data/repositories/info_repository.dart';
import 'data/repositories/recipe_repository.dart';

/// Widget raiz: configura tema, rotas e dependências.
class ReceitasFavoritasApp extends StatelessWidget {
  ReceitasFavoritasApp({
    super.key,
    RecipeRepository? recipeRepository,
    InfoRepository? infoRepository,
  }) : _router = AppRouter(
          recipeRepository: recipeRepository ?? LocalRecipeRepository(),
          infoRepository: infoRepository ?? LocalInfoRepository(),
        );

  final AppRouter _router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas Favoritas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.home,
      onGenerateRoute: _router.onGenerateRoute,
    );
  }
}
