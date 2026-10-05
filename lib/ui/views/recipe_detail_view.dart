import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../viewmodels/recipe_detail_view_model.dart';
import '../widgets/photo_placeholder.dart';

/// Tela com título, descrição, ingredientes e preparo da receita.
class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({super.key, required this.viewModel});

  final RecipeDetailViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes')),
      body: ListView(
        children: [
          PhotoPlaceholder(
            label: viewModel.title,
            colors: viewModel.recipe.placeholderColors,
            height: 170,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Text(
                  viewModel.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    height: 1.15,
                  ),
                ),
                Text(
                  viewModel.description,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: AppColors.textBody,
                  ),
                ),
                const _SectionTitle('Ingredientes'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    for (final ingredient in viewModel.ingredients)
                      _IngredientRow(ingredient),
                  ],
                ),
                const _SectionTitle('Modo de preparo'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    for (final (number, text) in viewModel.numberedSteps)
                      _StepRow(number: number, text: text),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Título de seção da tela de detalhes.
class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      ),
    );
  }
}

/// Ingrediente com marcador.
class _IngredientRow extends StatelessWidget {
  const _IngredientRow(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 15, height: 1.4);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text('•', style: style.copyWith(color: AppColors.primary)),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}

/// Passo do preparo com número em círculo.
class _StepRow extends StatelessWidget {
  const _StepRow({required this.number, required this.text});

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.accentSoft,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$number',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryDark,
            ),
          ),
        ),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 15, height: 1.5)),
        ),
      ],
    );
  }
}
