import 'package:jot_jai_app/features/session/presentation/widgets/result_widgets/mood_type.dart';

class WeeklyMood {
  final MoodType type;
  final String day;
  final bool isToday;

  WeeklyMood({
    required this.type,
    required this.day,
    this.isToday = false,
  });
}