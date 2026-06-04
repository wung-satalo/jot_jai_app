import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/date/date_widget.dart';
import 'package:jot_jai_app/features/greeting/presentation/greeting_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      // color: AppColors.darkBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GreetingText(), 
              SizedBox(height: 4),
              DateText()
            ],
          ),
          CircleAvatar(
            backgroundColor: AppColors.primary,
            child: Text(
              'SW',
              style: TextStyle(
                color: AppColors.background,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
