import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';
import 'package:jot_jai_app/features/home/presentation/screens/home_screen.dart';
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

  static const pages = [
    HomeScreen(),
    StatsScreen(),
    SizedBox.shrink(),
    ProfileScreen(),
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
      bottomNavigationBar: MainNavigationBar(
        activeIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}

class MainNavigationBar extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTap;

  const MainNavigationBar({
    super.key,
    required this.activeIndex,
    required this.onTap,
  });

  static const _disabledIndex = 2;
  static const _icons = [
    Icons.home,
    Icons.bar_chart,
    Icons.map_outlined,
    Icons.person,
  ];
  static const _labels = ["Home", "Stats", "Soon", "Profile"];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: _icons.length,
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      backgroundColor: AppColors.primary,
      notchMargin: 6,
      tabBuilder: (index, isActive) {
        final color = index == _disabledIndex
            ? AppColors.textPrimary.withValues(alpha: 0.4)
            : isActive
            ? AppColors.background
            : AppColors.textPrimary;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_icons[index], color: color),
            const SizedBox(height: 4),
            Text(_labels[index], style: TextStyle(color: color, fontSize: 12)),
          ],
        );
      },
      onTap: (index) {
        if (index != _disabledIndex) onTap(index);
      },
    );
  }
}
