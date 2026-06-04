import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

enum MoodType { rough, low, neutral, good, great }

extension MoodTypeExtension on MoodType {
  String get label => name[0].toUpperCase() + name.substring(1);

  IconData get icon {
    switch (this) {
      case MoodType.rough:
        return Symbols.sentiment_very_dissatisfied;
      case MoodType.low:
        return Symbols.sentiment_dissatisfied;
      case MoodType.neutral:
        return Symbols.sentiment_neutral;
      case MoodType.good:
        return Symbols.sentiment_satisfied;
      case MoodType.great:
        return Symbols.sentiment_very_satisfied;
    }
  }

  double get score {
    switch (this) {
      case MoodType.rough:
        return 1;
      case MoodType.low:
        return 2;
      case MoodType.neutral:
        return 3;
      case MoodType.good:
        return 4;
      case MoodType.great:
        return 5;
    }
  }
}
