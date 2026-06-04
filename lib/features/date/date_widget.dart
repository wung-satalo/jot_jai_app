import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class DateText extends StatelessWidget {
  const DateText({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final formatted = DateFormat('EEEE, d MMM').format(now);


    return Text(
      formatted,
      style: const TextStyle(
        color: AppColors.primary,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
