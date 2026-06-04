import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/session/presentation/screens/session_screen.dart';

class StartSessionButton extends StatelessWidget {
  final int duration;
  final String audio;
  final List<String> moods;

  const StartSessionButton({
    super.key,
    required this.duration,
    required this.audio,
    required this.moods,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,

          minimumSize: const Size(double.infinity, 60),

          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SessionRunningScreen(
              duration: duration,
              audio: audio,
              moods: moods,
            )),
          );
        },
        icon: const Icon(Icons.play_arrow_outlined, size: 28),
        label: const Text(
          "Start Session",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
