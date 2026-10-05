import 'package:flutter/painting.dart';

/// Receita exibida nos cards e na tela de detalhes.
class Recipe {
  const Recipe({
    required this.title,
    required this.summary,
    required this.description,
    required this.prepInfo,
    required this.ingredients,
    required this.steps,
    required this.placeholderColors,
  });

  final String title;
  final String summary;
  final String description;
  final String prepInfo;
  final List<String> ingredients;
  final List<String> steps;

  /// Par de cores das listras do placeholder da foto.
  final (Color, Color) placeholderColors;
}
