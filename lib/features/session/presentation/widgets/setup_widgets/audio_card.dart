import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class AudioItem {
  final String title;
  final String subtitle;
  final IconData icon;

  const AudioItem({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class AudioCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icons;
  final bool isSelected;
  final VoidCallback onTap;

  const AudioCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icons,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icons,
              color: isSelected ? AppColors.textOnPrimary : Colors.grey,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? AppColors.textOnPrimary : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: isSelected ? AppColors.textOnPrimary : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            if (isSelected)
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 18, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
