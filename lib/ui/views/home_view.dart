import 'package:flutter/material.dart';

import '../../core/routes/app_router.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/info_page.dart';
import '../../data/models/recipe.dart';
import '../viewmodels/home_view_model.dart';
import '../widgets/app_drawer.dart';
import '../widgets/category_tab_bar.dart';
import '../widgets/recipe_card.dart';

/// Tela principal com abas de categorias e Drawer.
class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel get _viewModel => widget.viewModel;

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  /// Abre os detalhes da receita mantendo a aba atual.
  void _openRecipe(Recipe recipe) {
    Navigator.pushNamed(context, AppRoutes.recipeDetail, arguments: recipe);
  }

  /// Fecha o Drawer e abre a tela informativa.
  void _openInfo(InfoPageType type) {
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoutes.info, arguments: type);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Receitas Favoritas'),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: Scaffold.of(context).openDrawer,
            ),
          ),
        ),
        drawer: AppDrawer(
          onSettingsTap: () => _openInfo(InfoPageType.settings),
          onAboutTap: () => _openInfo(InfoPageType.about),
        ),
        body: _RecipeList(
          key: ValueKey(_viewModel.selectedIndex),
          title: _viewModel.selectedCategory.name,
          recipes: _viewModel.recipes,
          onRecipeTap: _openRecipe,
        ),
        bottomNavigationBar: CategoryTabBar(
          categories: _viewModel.categories,
          selectedIndex: _viewModel.selectedIndex,
          onSelected: _viewModel.selectTab,
        ),
      ),
    );
  }
}

/// Lista de cards da categoria selecionada.
class _RecipeList extends StatelessWidget {
  const _RecipeList({
    super.key,
    required this.title,
    required this.recipes,
    required this.onRecipeTap,
  });

  final String title;
  final List<Recipe> recipes;
  final ValueChanged<Recipe> onRecipeTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: recipes.length + 1,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 13,
              letterSpacing: 0.4,
              color: AppColors.textMuted,
            ),
          );
        }
        final recipe = recipes[index - 1];
        return RecipeCard(recipe: recipe, onTap: () => onRecipeTap(recipe));
      },
    );
  }
}
