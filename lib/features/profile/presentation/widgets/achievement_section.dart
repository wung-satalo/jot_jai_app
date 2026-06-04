import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class AchievementSection extends StatelessWidget {
  const AchievementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),

        const SizedBox(height: 12),

        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: 5,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final items = [
                (Icons.calendar_today, "7 Day", true),
                (Icons.sunny, "Morning", true),
                (Icons.star, "30 Min", true),
                (Icons.fireplace_rounded, "30 Day", false),
                (Icons.diamond, "100x", false),
              ];

              final item = items[index];

              return _achievementItem(
                icon: item.$1,
                label: item.$2,
                isActive: item.$3,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _achievementItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Icon(
            icon,
            size: 28,
            color: isActive ? Colors.white : Colors.grey,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isActive ? AppColors.primary : Colors.grey,
          ),
        ),
      ],
    );
  }
}
