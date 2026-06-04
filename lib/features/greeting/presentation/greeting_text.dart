import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jot_jai_app/features/greeting/domain/greeting_service.dart';

class GreetingText extends StatefulWidget {
  const GreetingText({super.key});

  @override
  State<GreetingText> createState() => _GreetingTextState();
}

class _GreetingTextState extends State<GreetingText> {
  late String greeting;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _updateGreeting();

    timer = Timer.periodic(const Duration(minutes: 1), (_) {
      _updateGreeting();
    });
  }

  void _updateGreeting() {
    setState(() {
      greeting = GreetingService.getGreeting(DateTime.now());
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      greeting,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}