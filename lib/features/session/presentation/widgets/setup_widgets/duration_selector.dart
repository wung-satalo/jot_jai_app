import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class DurationSelector extends StatelessWidget {
  final int selected;
  final Function(int) onSelect;

  const DurationSelector({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final durations = [ 1, 5, 10, 15, 20, 30];

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "DURATION",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
      
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: durations.map((d) {
              final isSelected = d == selected;
      
              return GestureDetector(
                onTap: () => onSelect(d),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryLight
                        : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "$d min",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected
                          ? AppColors.textOnPrimary
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}