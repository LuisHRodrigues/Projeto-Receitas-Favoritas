import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/recipe_category.dart';

/// Barra de abas inferior com as categorias de receitas.
class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<RecipeCategory> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.navBackground,
        border: Border(top: BorderSide(color: AppColors.navBorder)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (final (index, category) in categories.indexed)
                Expanded(
                  child: _TabItem(
                    category: category,
                    selected: index == selectedIndex,
                    onTap: () => onSelected(index),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Item individual da barra de abas.
class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final RecipeCategory category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      button: true,
      child: InkResponse(
        onTap: onTap,
        highlightShape: BoxShape.rectangle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 58,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? AppColors.navIndicator : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(category.icon, style: const TextStyle(fontSize: 17)),
            ),
            const SizedBox(height: 4),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: selected ? AppColors.onSurface : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
