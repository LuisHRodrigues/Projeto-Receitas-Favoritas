import 'package:flutter/foundation.dart';

import '../../data/models/recipe.dart';
import '../../data/models/recipe_category.dart';
import '../../data/repositories/recipe_repository.dart';

/// Estado da tela principal: categorias e aba selecionada.
class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required RecipeRepository repository})
      : categories = repository.getCategories();

  final List<RecipeCategory> categories;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  RecipeCategory get selectedCategory => categories[_selectedIndex];

  List<Recipe> get recipes => selectedCategory.recipes;

  /// Troca a aba ativa e notifica a tela.
  void selectTab(int index) {
    if (index == _selectedIndex) return;
    _selectedIndex = index;
    notifyListeners();
  }
}
