import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [3, 5, 2, 8, 4, 6, 1];
    final days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.textOnPrimary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Weekly", 
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold
              )
              ),
              Text("183 minute",
              style: TextStyle(
                color: AppColors.textPrimary
              ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(data.length, (index) {
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      height: data[index] * 10,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index == 3
                            ? AppColors.primary
                            : AppColors.primary.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(days[index]),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
