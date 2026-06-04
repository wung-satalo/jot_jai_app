import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/session/presentation/widgets/result_widgets/mood_type.dart';
import 'package:jot_jai_app/features/stats/models/weekly_mood.dart';
class MoodSection extends StatefulWidget {
  const MoodSection({super.key});

  @override
  State<MoodSection> createState() => _MoodSectionState();
}

class _MoodSectionState extends State<MoodSection> {
  int selectedIndex = 3;

  final moods = [
    WeeklyMood(type: MoodType.neutral, day: "Mon"),
    WeeklyMood(type: MoodType.good, day: "Tue"),
    WeeklyMood(type: MoodType.neutral, day: "Wed"),
    WeeklyMood(type: MoodType.great, day: "Thu", isToday: true),
    WeeklyMood(type: MoodType.good, day: "Fri"),
    WeeklyMood(type: MoodType.great, day: "Sat"),
    WeeklyMood(type: MoodType.good, day: "Sun"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mood",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: moods.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = moods[index];

                return _MoodItem(
                  data: item,
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.trending_up, size: 18, color: Colors.green),
              const SizedBox(width: 6),
              Text(
                "+0.8 this week",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MoodItem extends StatelessWidget {
  final WeeklyMood data;
  final bool isSelected;
  final VoidCallback onTap;

  const _MoodItem({
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 64,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔥 Icon แบบ production
            AnimatedScale(
              scale: isSelected ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutBack,
              child: Icon(
                data.type.icon,
                size: 30,
                color: isSelected ? AppColors.accent : Colors.grey.shade400,

                // 🔥 ของดี Material Symbols
                fill: isSelected ? 1 : 0,
                weight: 500,
                grade: 200,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              data.day,
              style: TextStyle(
                fontSize: 11,
                fontWeight:
                    data.isToday ? FontWeight.w600 : FontWeight.normal,
                color: data.isToday ? AppColors.accent : Colors.grey,
              ),
            ),

            if (data.isToday)
              Container(
                margin: const EdgeInsets.only(top: 3),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
