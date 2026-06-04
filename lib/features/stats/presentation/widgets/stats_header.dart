import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class StatsHeader extends StatelessWidget {
  const StatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: const [
        Expanded(
          child: _Item(title: "24h", subtitle: "Total time"),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _Item(title: "47", subtitle: "Times"),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _Item(title: "14", subtitle: "day streak", isHighlight: true),
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isHighlight;

  const _Item({
    required this.title,
    required this.subtitle,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: isHighlight ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isHighlight ? Colors.white : AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: isHighlight
                  ? AppColors.textOnPrimary
                  : AppColors.primary.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
