import '../../data/models/info_page.dart';
import '../../data/repositories/info_repository.dart';

/// Carrega o conteúdo de uma tela informativa.
class InfoViewModel {
  InfoViewModel({
    required InfoRepository repository,
    required InfoPageType type,
  }) : _page = repository.getPage(type);

  final InfoPage _page;

  String get title => _page.title;

  List<InfoItem> get items => _page.items;
}
