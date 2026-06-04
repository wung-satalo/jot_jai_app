import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import '../widgets/stats_header.dart';
import '../widgets/weekly_chart.dart';
import '../widgets/mood_section.dart';
import '../widgets/calendar_section.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            Text(
              "Stats",
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            StatsHeader(),

            SizedBox(height: 20),

            WeeklyChart(),

            SizedBox(height: 20),

            MoodSection(),

            SizedBox(height: 20),

            CalendarSection(),

          ],
        ),
      ),
    );
  }
}