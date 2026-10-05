import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:receitas_favoritas/app.dart';

/// Monta o app numa tela alta o bastante para os três cards.
Future<void> _pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 1400);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(ReceitasFavoritasApp());
}

void main() {
  testWidgets('abre a primeira aba com três receitas de Doces', (tester) async {
    await _pumpApp(tester);

    expect(find.text('DOCES'), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(3));
    expect(find.text('Brigadeiro'), findsOneWidget);
  });

  testWidgets('volta dos detalhes para a mesma aba', (tester) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Bebidas'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Suco Verde'));
    await tester.pumpAndSettle();

    expect(find.text('Detalhes'), findsOneWidget);
    expect(find.text('Ingredientes'), findsOneWidget);
    expect(find.text('Modo de preparo'), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('BEBIDAS'), findsOneWidget);
  });

  testWidgets('Drawer leva para Configurações e Sobre', (tester) async {
    await _pumpApp(tester);

    await tester.tap(find.byTooltip('Menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Configurações'));
    await tester.pumpAndSettle();
    expect(find.text('Idioma'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sobre'));
    await tester.pumpAndSettle();
    expect(find.text('Versão'), findsOneWidget);
  });
}
