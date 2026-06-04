import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'mood_type.dart';

class MoodSelector extends StatelessWidget {
  final MoodType selected;
  final ValueChanged<MoodType> onChanged;

  const MoodSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: MoodType.values.map((mood) {
          return _MoodItem(
            mood: mood,
            isSelected: selected == mood,
            onTap: () => onChanged(mood),
          );
        }).toList(),
      ),
    );
  }
}

class _MoodItem extends StatelessWidget {
  final MoodType mood;
  final bool isSelected;
  final VoidCallback onTap;

  const _MoodItem({
    required this.mood,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 64,
          child: Column(
            children: [
              AnimatedScale(
                scale: isSelected ? 1.1 : 1.0,
                duration: const Duration(milliseconds: 150),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.accent.withValues(alpha: 0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color:
                          isSelected ? AppColors.accent : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    mood.icon,
                    size: 28,
                    color: isSelected ? AppColors.accent : Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                mood.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? AppColors.accent : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}