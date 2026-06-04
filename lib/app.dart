import 'package:flutter/material.dart';
import 'package:jot_jai_app/features/home/presentation/widgets/bottom_navbar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Prompt",
      ),

      debugShowCheckedModeBanner: true,
      home: const MainPage(),
    );
  }
}
