import '../../data/models/recipe.dart';

/// Expõe os dados da receita prontos para a tela de detalhes.
class RecipeDetailViewModel {
  const RecipeDetailViewModel(this.recipe);

  final Recipe recipe;

  String get title => recipe.title;

  String get description => recipe.description;

  List<String> get ingredients => recipe.ingredients;

  /// Passos do preparo com sua numeração a partir de 1.
  List<(int, String)> get numberedSteps => [
        for (final (index, step) in recipe.steps.indexed) (index + 1, step),
      ];
}
