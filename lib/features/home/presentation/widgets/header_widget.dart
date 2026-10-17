import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/date/date_widget.dart';
import 'package:jot_jai_app/features/greeting/presentation/greeting_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [GreetingText(), SizedBox(height: 6), DateText()],
          ),
        ),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.surface, width: 3),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.16),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'SW',
              style: TextStyle(
                color: AppColors.textOnPrimary,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
