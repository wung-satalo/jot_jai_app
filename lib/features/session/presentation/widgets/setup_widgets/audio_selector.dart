import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/session/presentation/widgets/setup_widgets/audio_card.dart';
import 'package:jot_jai_app/features/session/presentation/widgets/setup_widgets/audio_type_segment.dart';

class AudioSelector extends StatelessWidget {
  final String selected;
  final Function(String) onSelect;

  const AudioSelector({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final audios = [
      const AudioItem(
        title: "Rainy Forest",
        subtitle: "Soft rain · birds · wind",
        icon: Icons.water_drop,
      ),
      const AudioItem(
        title: "Ocean Waves",
        subtitle: "Gentle surf · deep calm",
        icon: Icons.waves,
      ),
      const AudioItem(
        title: "Forest Birdsong",
        subtitle: "Morning birds · breeze",
        icon: Icons.forest,
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "AUDIO TYPE",
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),

          const AudioTypeSegment(),

          const SizedBox(height: 20),

          ...audios.map((audio) {
            final isSelected = selected == audio.title;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              
              child: AudioCard(
                title: audio.title,
                subtitle: audio.subtitle,
                icons: audio.icon,
                isSelected: isSelected,
                onTap: () => onSelect(audio.title),
              ),
            );
          }),
        ],
      ),
    );
  }
}
