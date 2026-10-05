import 'dart:ui';

import '../models/recipe.dart';
import '../models/recipe_category.dart';

/// Fonte de dados das receitas.
abstract interface class RecipeRepository {
  /// Retorna todas as categorias com suas receitas.
  List<RecipeCategory> getCategories();
}

/// Implementação com receitas fixas em memória.
class LocalRecipeRepository implements RecipeRepository {
  @override
  List<RecipeCategory> getCategories() => _categories;

  static const _categories = [
    RecipeCategory(
      name: 'Doces',
      icon: '🍰',
      recipes: [
        Recipe(
          title: 'Brigadeiro',
          placeholderColors: (Color(0xFFF1DCC8), Color(0xFFE8C9AD)),
          prepInfo: '30 min · 20 unidades',
          summary: 'O clássico doce de festa, cremoso e enrolado na hora.',
          description:
              'Docinho brasileiro de chocolate, feito com poucos ingredientes e muito carinho.',
          ingredients: [
            '1 lata de leite condensado',
            '2 colheres (sopa) de chocolate em pó',
            '1 colher (sopa) de manteiga',
            'Chocolate granulado a gosto',
          ],
          steps: [
            'Misture o leite condensado, o chocolate e a manteiga em uma panela.',
            'Cozinhe em fogo baixo, mexendo sempre, até desgrudar do fundo.',
            'Deixe esfriar, enrole bolinhas e passe no granulado.',
          ],
        ),
        Recipe(
          title: 'Pudim de Leite',
          placeholderColors: (Color(0xFFF6E4C0), Color(0xFFEFD49E)),
          prepInfo: '1h30 · 8 porções',
          summary: 'Pudim liso e firme com calda de caramelo.',
          description:
              'Sobremesa tradicional, cremosa e sem furinhos, perfeita para o domingo em família.',
          ingredients: [
            '1 lata de leite condensado',
            '2 latas de leite (use a lata como medida)',
            '3 ovos',
            '1 xícara de açúcar para a calda',
          ],
          steps: [
            'Derreta o açúcar em fogo médio até virar caramelo e cubra a forma.',
            'Bata no liquidificador o leite condensado, o leite e os ovos.',
            'Despeje na forma e asse em banho-maria a 180 °C por 1 hora.',
            'Leve à geladeira por 4 horas antes de desenformar.',
          ],
        ),
        Recipe(
          title: 'Bolo de Cenoura',
          placeholderColors: (Color(0xFFF4CFA6), Color(0xFFEBB985)),
          prepInfo: '50 min · 12 fatias',
          summary: 'Fofinho, com cobertura de chocolate.',
          description:
              'Bolo macio e úmido, com a famosa cobertura de chocolate que escorre pelas laterais.',
          ingredients: [
            '3 cenouras médias',
            '4 ovos',
            '1 xícara de óleo',
            '2 xícaras de açúcar',
            '2½ xícaras de farinha de trigo',
            '1 colher (sopa) de fermento',
          ],
          steps: [
            'Bata no liquidificador as cenouras, os ovos e o óleo.',
            'Misture com o açúcar e a farinha; acrescente o fermento por último.',
            'Asse em forma untada a 180 °C por 40 minutos.',
            'Cubra com calda de chocolate morna.',
          ],
        ),
      ],
    ),
    RecipeCategory(
      name: 'Salgadas',
      icon: '🥘',
      recipes: [
        Recipe(
          title: 'Lasanha à Bolonhesa',
          placeholderColors: (Color(0xFFF2CDB5), Color(0xFFE6B394)),
          prepInfo: '1h20 · 6 porções',
          summary: 'Camadas de massa, molho e queijo gratinado.',
          description:
              'Prato farto e reconfortante, com molho de carne e muito queijo derretido.',
          ingredients: [
            '500 g de massa de lasanha',
            '500 g de carne moída',
            '700 ml de molho de tomate',
            '400 g de presunto',
            '400 g de muçarela',
            'Queijo ralado',
          ],
          steps: [
            'Refogue a carne e junte o molho de tomate.',
            'Em um refratário, alterne massa, molho, presunto e muçarela.',
            'Finalize com queijo ralado e asse a 200 °C por 30 minutos.',
          ],
        ),
        Recipe(
          title: 'Feijoada',
          placeholderColors: (Color(0xFFD9C5B0), Color(0xFFC4AA8F)),
          prepInfo: '3h · 8 porções',
          summary: 'Feijão preto com carnes, o prato símbolo do Brasil.',
          description:
              'Cozida lentamente, acompanha arroz, couve, farofa e laranja.',
          ingredients: [
            '1 kg de feijão preto',
            '300 g de linguiça calabresa',
            '300 g de costelinha de porco',
            '200 g de bacon',
            '4 dentes de alho',
            'Folhas de louro',
          ],
          steps: [
            'Deixe o feijão de molho por uma noite.',
            'Cozinhe com as carnes e o louro por cerca de 2 horas.',
            'Refogue alho e bacon e misture ao caldo.',
            'Sirva com arroz, couve e farofa.',
          ],
        ),
        Recipe(
          title: 'Strogonoff de Frango',
          placeholderColors: (Color(0xFFF5DFB8), Color(0xFFECC98F)),
          prepInfo: '35 min · 4 porções',
          summary: 'Molho cremoso, rápido e prático.',
          description:
              'Receita fácil de dia a dia, servida com arroz branco e batata palha.',
          ingredients: [
            '600 g de peito de frango em cubos',
            '1 cebola picada',
            '2 colheres (sopa) de ketchup',
            '1 colher (sopa) de mostarda',
            '1 caixa de creme de leite',
            'Cogumelos a gosto',
          ],
          steps: [
            'Refogue a cebola e o frango até dourar.',
            'Junte ketchup, mostarda e cogumelos; cozinhe 10 minutos.',
            'Desligue o fogo, adicione o creme de leite e misture.',
          ],
        ),
      ],
    ),
    RecipeCategory(
      name: 'Bebidas',
      icon: '🥤',
      recipes: [
        Recipe(
          title: 'Limonada Suíça',
          placeholderColors: (Color(0xFFE3EFC4), Color(0xFFCFE19F)),
          prepInfo: '10 min · 4 copos',
          summary: 'Cremosa, gelada e bem refrescante.',
          description:
              'Limão batido com a casca e leite condensado, uma bebida clássica de verão.',
          ingredients: [
            '4 limões',
            '1 lata de leite condensado',
            '1 litro de água gelada',
            'Gelo a gosto',
          ],
          steps: [
            'Lave bem os limões e corte em quatro, sem o miolo branco.',
            'Bata tudo rapidamente no liquidificador, com pulsos.',
            'Coe e sirva com bastante gelo.',
          ],
        ),
        Recipe(
          title: 'Chocolate Quente',
          placeholderColors: (Color(0xFFE2C3AD), Color(0xFFD1A98B)),
          prepInfo: '15 min · 2 xícaras',
          summary: 'Denso, quente e perfeito para o frio.',
          description:
              'Chocolate cremoso, ideal para dias frios, com um toque de canela.',
          ingredients: [
            '2 xícaras de leite',
            '100 g de chocolate meio amargo',
            '1 colher (sopa) de açúcar',
            '1 pau de canela',
          ],
          steps: [
            'Aqueça o leite com a canela sem deixar ferver.',
            'Adicione o chocolate picado e o açúcar.',
            'Mexa até derreter e ficar cremoso. Sirva quente.',
          ],
        ),
        Recipe(
          title: 'Suco Verde',
          placeholderColors: (Color(0xFFD2E8B6), Color(0xFFB8D894)),
          prepInfo: '5 min · 2 copos',
          summary: 'Leve, com couve, limão e gengibre.',
          description: 'Suco detox simples para começar o dia com energia.',
          ingredients: [
            '1 folha de couve',
            '1 maçã',
            'Suco de 1 limão',
            '1 pedaço pequeno de gengibre',
            '300 ml de água de coco',
          ],
          steps: [
            'Coloque todos os ingredientes no liquidificador.',
            'Bata por 1 minuto e coe se preferir.',
            'Sirva imediatamente.',
          ],
        ),
      ],
    ),
  ];
}
