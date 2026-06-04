import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/home/presentation/screens/home_screen.dart';
import 'package:jot_jai_app/features/map/presentation/screens/map_screen.dart';
import 'package:jot_jai_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:jot_jai_app/features/session/presentation/screens/session_setup_screen.dart';
import 'package:jot_jai_app/features/stats/presentation/screens/stats_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _bottomNavIndex = 0;

  final iconList = [
    Icons.home,
    Icons.map,
    Icons.bar_chart,
    Icons.person,
  ];

  final textList = ["Home", "Map", "Stats", "Profile"];

  final pages = [
    const HomeScreen(),
    const MapScreen(),
    const StatsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // extendBody: true,

      body: IndexedStack(index: _bottomNavIndex, children: pages),

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        splashColor: AppColors.primary,
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.textOnPrimary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SessionSetupScreen()),
          );
        },
        child: const Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        backgroundColor: AppColors.primary,
        notchMargin: 6,
        tabBuilder: (index, isActive) {
          final color = isActive ? AppColors.background : AppColors.textPrimary;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconList[index], color: color),
              const SizedBox(height: 4),
              Text(
                textList[index],
                style: TextStyle(color: color, fontSize: 12),
              ),
            ],
          );
        },
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}
