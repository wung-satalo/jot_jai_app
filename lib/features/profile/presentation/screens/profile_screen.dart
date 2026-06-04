import 'package:flutter/material.dart';
import 'package:jot_jai_app/features/profile/presentation/widgets/achievement_section.dart';
import 'package:jot_jai_app/features/profile/presentation/widgets/profile_card.dart';
import 'package:jot_jai_app/features/profile/presentation/widgets/profile_stats.dart';
import 'package:jot_jai_app/features/profile/presentation/widgets/setting_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProfileCard(),
          ProfileStats(),
          AchievementSection(),
          SettingsSection(),
        ],
      ),
    );
  }
}