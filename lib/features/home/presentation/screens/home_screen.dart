import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/header_widget.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/progress_card.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/start_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const HeaderWidget(),
                const SizedBox(height: 36),
                Text(
                  'Your practice',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Small steps make a meaningful difference.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                const ProgressCard(),
                const SizedBox(height: 28),
                const StartButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
