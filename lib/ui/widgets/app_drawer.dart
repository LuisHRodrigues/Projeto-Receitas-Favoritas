import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Menu lateral com as funções gerais do aplicativo.
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.onSettingsTap,
    required this.onAboutTap,
  });

  final VoidCallback onSettingsTap;
  final VoidCallback onAboutTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: MediaQuery.paddingOf(context).top),
          const _DrawerHeader(),
          _DrawerItem(
            icon: '⚙️',
            label: 'Configurações',
            onTap: onSettingsTap,
          ),
          _DrawerItem(icon: 'ℹ️', label: 'Sobre', onTap: onAboutTap),
        ],
      ),
    );
  }
}

/// Cabeçalho do Drawer com o nome do app.
class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.accentSoft,
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('🍲', style: TextStyle(fontSize: 30)),
          SizedBox(height: 4),
          Text(
            'Receitas Favoritas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Text(
            'Menu do aplicativo',
            style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

/// Opção clicável do Drawer.
class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(28),
          hoverColor: AppColors.accentSoft,
          child: SizedBox(
            height: 56,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                    child: Text(icon, style: const TextStyle(fontSize: 20)),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
