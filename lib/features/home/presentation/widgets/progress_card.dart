import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, Color(0xFF496C9D)],
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 76,
                height: 76,
                child: CircularProgressIndicator(
                  value: 0.9,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 8,
                  color: const Color(0xFFA9C5F0),
                  backgroundColor: Colors.white24,
                ),
              ),
              const Text(
                "90%",
                style: TextStyle(
                  color: AppColors.textOnPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "DAILY GOAL",
                  style: TextStyle(
                    color: AppColors.textOnPrimary,
                    fontSize: 11,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "18 / 20 min",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_fire_department_rounded,
                        size: 15,
                        color: Color(0xFFFFD18A),
                      ),
                      SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          "14-day streak",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.textOnPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
