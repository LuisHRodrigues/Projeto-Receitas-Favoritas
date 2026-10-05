# 🍲 Receitas Favoritas

Aplicativo Flutter para explorar receitas de **doces**, **salgadas** e **bebidas**. O projeto foi feito para praticar navegação por abas, navegação entre telas e menu lateral (Drawer), usando a arquitetura **MVVM** e os princípios de **Clean Code**.

## Funcionalidades

- **Abas inferiores** com três categorias: Doces, Salgadas e Bebidas, cada uma com três receitas
- **Cards de receita** com foto (placeholder), título, resumo e tempo de preparo
- **Tela de detalhes** com título, descrição, lista de ingredientes e modo de preparo numerado
- **Volta para a mesma aba** de onde o usuário saiu ao sair dos detalhes
- **Drawer** aberto pelo ícone de menu, com as telas **Configurações** e **Sobre**
- Retorno pela seta da AppBar ou pelo botão "voltar" do dispositivo

## Arquitetura

O projeto segue o padrão **MVVM (Model-View-ViewModel)**:

```
lib/
├── main.dart                 # Ponto de entrada
├── app.dart                  # MaterialApp, tema e rotas
├── core/
│   ├── routes/               # Rotas nomeadas e injeção dos ViewModels
│   └── theme/                # Cores e tema Material 3
├── data/
│   ├── models/               # Recipe, RecipeCategory, InfoPage
│   └── repositories/         # Fontes de dados (receitas e telas informativas)
└── ui/
    ├── viewmodels/           # Estado e lógica de cada tela
    ├── views/                # Telas: Home, Detalhes, Info
    └── widgets/              # Card, barra de abas, Drawer, placeholder de foto
```

- **Model:** classes imutáveis que representam receitas, categorias e informações
- **Repository:** interfaces com implementações locais, fáceis de trocar por uma API no futuro
- **ViewModel:** guarda o estado da tela; o `HomeViewModel` usa `ChangeNotifier` para controlar a aba ativa
- **View:** widgets que apenas exibem os dados do ViewModel

O app não usa pacotes externos, apenas o SDK do Flutter.

## Como executar

Pré-requisito: [Flutter](https://docs.flutter.dev/get-started/install) instalado (Dart 3.5 ou superior).

```bash
git clone <url-do-repositorio>
cd receitas_favoritas
flutter pub get
flutter run
```

## Testes

```bash
flutter test
```

Os testes de widget verificam:

- a exibição das três receitas da primeira aba
- o retorno dos detalhes para a mesma aba
- a navegação do Drawer para Configurações e Sobre

## Tecnologias

- Flutter e Dart
- Material 3
- flutter_test e flutter_lints
