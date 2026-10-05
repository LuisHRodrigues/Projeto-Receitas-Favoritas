import '../models/info_page.dart';

/// Fonte de dados das telas informativas.
abstract interface class InfoRepository {
  /// Retorna o conteúdo da tela do [type] informado.
  InfoPage getPage(InfoPageType type);
}

/// Implementação com conteúdo fixo em memória.
class LocalInfoRepository implements InfoRepository {
  static const _pages = {
    InfoPageType.settings: InfoPage(
      title: 'Configurações',
      items: [
        InfoItem(label: 'Idioma', value: 'Português (Brasil)'),
        InfoItem(label: 'Tema', value: 'Claro'),
        InfoItem(label: 'Notificações', value: 'Desativadas'),
        InfoItem(label: 'Unidades de medida', value: 'Xícaras e colheres'),
      ],
    ),
    InfoPageType.about: InfoPage(
      title: 'Sobre',
      items: [
        InfoItem(
          label: 'Receitas Favoritas',
          value: 'Aplicativo para explorar receitas de doces, salgadas e bebidas.',
        ),
        InfoItem(label: 'Versão', value: '1.0.0'),
        InfoItem(label: 'Desenvolvido com', value: 'Flutter'),
        InfoItem(
          label: 'Navegação',
          value: 'Abas inferiores, Drawer e telas de detalhe.',
        ),
      ],
    ),
  };

  @override
  InfoPage getPage(InfoPageType type) => _pages[type]!;
}
