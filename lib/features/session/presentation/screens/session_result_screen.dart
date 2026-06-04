import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import '../widgets/result_widgets/mood_selector.dart';
import '../widgets/result_widgets/mood_type.dart';
import '../widgets/result_widgets/session_bottom_bar.dart';
import '../widgets/result_widgets/session_tags.dart';

class SessionResultScreen extends StatefulWidget {
  final int duration;
  final String audio;
  final List<String> moods;

  const SessionResultScreen({
    super.key,
    required this.duration,
    required this.audio,
    required this.moods,
  });

  @override
  State<SessionResultScreen> createState() => _SessionResultScreenState();
}

class _SessionResultScreenState extends State<SessionResultScreen> {
  MoodType selectedMood = MoodType.good;
  final TextEditingController noteController = TextEditingController();

  final List<String> tags = ["calm", "focused", "sleep", "anxiety"];
  final Set<String> selectedTags = {"calm", "focused"};

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  void _onToggleTag(String tag) {
    setState(() {
      selectedTags.contains(tag)
          ? selectedTags.remove(tag)
          : selectedTags.add(tag);
    });
  }

  void _onSave() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: SessionBottomBar(
        onSkip: () => Navigator.of(context).pop(),
        onSave: _onSave,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Reflect",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _CompletedBadge(duration: widget.duration),

              const SizedBox(height: 30),

              const Text(
                "How do you feel now?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 20),

              MoodSelector(
                selected: selectedMood,
                onChanged: (mood) => setState(() => selectedMood = mood),
              ),

              const SizedBox(height: 30),

              const Text(
                "Add a note",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: noteController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Felt quite peaceful today.",
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Tags",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              SessionTags(
                tags: tags,
                selectedTags: selectedTags,
                onToggle: _onToggleTag,
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompletedBadge extends StatelessWidget {
  final int duration;

  const _CompletedBadge({required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, size: 18, color: AppColors.accent),
          const SizedBox(width: 8),
          Text("$duration min completed"),
        ],
      ),
    );
  }
}