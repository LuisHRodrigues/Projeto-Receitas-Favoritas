import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Placeholder listrado no lugar da foto do prato.
class PhotoPlaceholder extends StatelessWidget {
  const PhotoPlaceholder({
    super.key,
    required this.label,
    required this.colors,
    required this.height,
    required this.padding,
  });

  final String label;
  final (Color, Color) colors;
  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _StripesPainter(colors),
      child: Container(
        height: height,
        width: double.infinity,
        padding: padding,
        alignment: Alignment.bottomLeft,
        child: Text(
          'foto: $label',
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 11,
            color: AppColors.placeholderLabel,
          ),
        ),
      ),
    );
  }
}

/// Desenha listras diagonais de 14px alternando duas cores.
class _StripesPainter extends CustomPainter {
  const _StripesPainter(this.colors);

  static const _period = 28.0;

  final (Color, Color) colors;

  @override
  void paint(Canvas canvas, Size size) {
    final step = _period / math.sqrt2;
    final (first, second) = colors;
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(step, step),
        [first, first, second, second],
        [0, 0.5, 0.5, 1],
        TileMode.repeated,
      );
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(_StripesPainter oldDelegate) =>
      oldDelegate.colors != colors;
}
