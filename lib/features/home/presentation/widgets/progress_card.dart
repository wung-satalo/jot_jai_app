import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: 0.9,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 9,
                  color: AppColors.accent,
                  backgroundColor: Colors.white24,
                ),
              ),
              const Text(
                "90%",
                style: TextStyle(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's progress",
                style: TextStyle(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "18 / 20 min",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "14-day streak",
                style: TextStyle(color: AppColors.accent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
