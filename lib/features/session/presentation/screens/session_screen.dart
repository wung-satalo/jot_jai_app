import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/session/presentation/screens/session_result_screen.dart';

class SessionRunningScreen extends StatefulWidget {
  final int duration;
  final String audio;
  final List<String> moods;

  const SessionRunningScreen({
    super.key,
    required this.duration,
    required this.audio,
    required this.moods,
  });

  @override
  State<SessionRunningScreen> createState() => _SessionRunningScreenState();
}

class _SessionRunningScreenState extends State<SessionRunningScreen>
    with SingleTickerProviderStateMixin {
  late int totalSeconds;
  late int remainingSeconds;
  Timer? timer;
  bool isRunning = true;

  late AnimationController _breathController;

  @override
  void initState() {
    super.initState();

    totalSeconds = widget.duration * 60;
    remainingSeconds = totalSeconds;

    startTimer();

    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || !isRunning) return;

      if (remainingSeconds > 0) {
        setState(() => remainingSeconds--);
      } else {
        timer?.cancel();
        onSessionComplete();
      }
    });
  }

  void onSessionComplete() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => SessionResultScreen(
          duration: widget.duration,
          audio: widget.audio,
          moods: widget.moods,
        ),
      ),
    );
  }

  void togglePause() {
    setState(() {
      isRunning = !isRunning;

      if (isRunning) {
        _breathController.repeat(reverse: true);
      } else {
        _breathController.stop();
      }
    });
  }

  void stopSession() {
    timer?.cancel();
    Navigator.pop(context);
  }

  String formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }

  @override
  void dispose() {
    timer?.cancel();
    _breathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          Text(
            widget.audio,
            style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
          ),

          const SizedBox(height: 6),

          Text(
            widget.moods.join(", "),
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),

          const SizedBox(height: 40),

          Center(
            child: AnimatedBuilder(
              animation: _breathController,
              builder: (context, child) {
                final scale = 0.8 + (_breathController.value * 0.4);

                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 40),

          Text(
            formatTime(remainingSeconds),
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 40,
                icon: Icon(isRunning ? Icons.pause_circle : Icons.play_circle),
                color: AppColors.primaryLight,
                onPressed: togglePause,
              ),

              const SizedBox(width: 20),

              IconButton(
                iconSize: 40,
                icon: const Icon(Icons.stop_circle),
                color: AppColors.primaryLight,
                onPressed: stopSession,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
