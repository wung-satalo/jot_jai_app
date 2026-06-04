import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),

      child: Row(
        children: const [
          Expanded(
            child: _StatItem(value: "47", label: "Sessions"),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _StatItem(value: "24h", label: "Total time"),
          ),
          SizedBox(width: 12),
          Expanded(
            child: _StatItem(value: "18", label: "Streak"),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.softBackground, // พื้นหลังอ่อน
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.border, // เส้นขอบฟ้าอ่อน
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
