import 'package:flutter/material.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/header_widget.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/progress_card.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/realtime_statusmap.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/start_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const HeaderWidget(),
              const ProgressCard(),
              const RealtimeStatusmap(),
              const StartButton(),
            ]
            ),
        ),
      );
  }
}
