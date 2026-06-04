import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class SessionBottomBar extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onSave;

  const SessionBottomBar({
    super.key,
    required this.onSkip,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: BoxDecoration(
          color: AppColors.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textPrimary,
                  side: BorderSide(color: AppColors.textPrimary),
                  backgroundColor: AppColors.surface,
                ),
                onPressed: onSkip,
                child: const Text("Skip"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: AppColors.textPrimary,
                ),
                onPressed: onSave,
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}