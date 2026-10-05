import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/models/info_page.dart';
import '../viewmodels/info_view_model.dart';

/// Tela informativa usada por Configurações e Sobre.
class InfoView extends StatelessWidget {
  const InfoView({super.key, required this.viewModel});

  final InfoViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: viewModel.items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 4),
        itemBuilder: (_, index) => _InfoRow(viewModel.items[index]),
      ),
    );
  }
}

/// Linha com rótulo, valor e divisória inferior.
class _InfoRow extends StatelessWidget {
  const _InfoRow(this.item);

  final InfoItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 2,
        children: [
          Text(item.label, style: const TextStyle(fontSize: 16)),
          Text(
            item.value,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
