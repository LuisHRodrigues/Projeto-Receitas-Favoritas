/// Telas informativas acessadas pelo Drawer.
enum InfoPageType { settings, about }

/// Linha de informação no formato rótulo e valor.
class InfoItem {
  const InfoItem({required this.label, required this.value});

  final String label;
  final String value;
}

/// Conteúdo de uma tela informativa.
class InfoPage {
  const InfoPage({required this.title, required this.items});

  final String title;
  final List<InfoItem> items;
}
