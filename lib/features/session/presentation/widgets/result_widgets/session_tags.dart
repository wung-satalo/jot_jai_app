import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class SessionTags extends StatelessWidget {
  final List<String> tags;
  final Set<String> selectedTags;
  final ValueChanged<String> onToggle;

  const SessionTags({
    super.key,
    required this.tags,
    required this.selectedTags,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tags.map((tag) {
        final isSelected = selectedTags.contains(tag);

        return GestureDetector(
          onTap: () => onToggle(tag),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.accent.withValues(alpha: 0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? AppColors.accent : Colors.grey.shade300,
              ),
            ),
            child: Text(
              "#$tag",
              style: TextStyle(
                color: isSelected ? AppColors.accent : Colors.grey,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}