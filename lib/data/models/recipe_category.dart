import 'recipe.dart';

/// Categoria de receitas exibida como aba inferior.
class RecipeCategory {
  const RecipeCategory({
    required this.name,
    required this.icon,
    required this.recipes,
  });

  final String name;
  final String icon;
  final List<Recipe> recipes;
}
