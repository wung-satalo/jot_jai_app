import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/session/presentation/widgets/result_widgets/mood_selector.dart';
import 'package:jot_jai_app/features/session/presentation/widgets/setup_widgets/audio_selector.dart';
import 'package:jot_jai_app/features/session/presentation/widgets/setup_widgets/duration_selector.dart';
import 'package:jot_jai_app/features/session/presentation/widgets/setup_widgets/start_session.dart';

import '../widgets/result_widgets/mood_type.dart';

class SessionSetupScreen extends StatefulWidget {
  const SessionSetupScreen({super.key});

  @override
  State<SessionSetupScreen> createState() => _SessionSetupScreenState();
}

class _SessionSetupScreenState extends State<SessionSetupScreen> {
  int selectedDuration = 15;
  String selectedAudio = "Rainy Forest";
  MoodType selectedMood = MoodType.good;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "New Session",
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(color: AppColors.primary),
      ),
      bottomNavigationBar: StartSessionButton(
        duration: selectedDuration,
        audio: selectedAudio,
        moods: [selectedMood.name],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DurationSelector(
                      selected: selectedDuration,
                      onSelect: (val) => setState(() => selectedDuration = val),
                    ),

                    AudioSelector(
                      selected: selectedAudio,
                      onSelect: (val) => setState(() => selectedAudio = val),
                    ),

                    MoodSelector(
                      selected: selectedMood,
                      onChanged: (val) => setState(() => selectedMood = val),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
