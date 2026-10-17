import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';
    final name =
        user?.displayName ??
        (email.isNotEmpty ? email.split('@').first : 'JotJai User');
    final initials = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .take(2)
        .map((part) => part[0].toUpperCase())
        .join();

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.border, width: 3),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.reward,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 3),
                  ),
                  child: Icon(
                    Icons.star,
                    size: 16,
                    color: AppColors.background,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(email, style: TextStyle(fontSize: 14, color: AppColors.border)),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildInfoChip(
                icon: Icons.local_fire_department_outlined,
                text: "14-day streak",
              ),
              const SizedBox(width: 12),
              _buildInfoChip(
                icon: Icons.workspace_premium_outlined,
                text: "Level 7",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.amber900),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.textOnPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
