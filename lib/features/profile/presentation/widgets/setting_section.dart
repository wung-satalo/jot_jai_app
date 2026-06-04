import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.softBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(        
        children: const [

          _SettingItem(icon: Icons.notifications_none, title: "Notifications"),
          Divider(height: 1),

          _SettingItem(
            icon: Icons.track_changes,
            title: "Goals",
            value: "20 Minute",
          ),
          Divider(height: 1),

          _SettingItem(
            icon: Icons.dark_mode_outlined,
            title: "Theme",
            value: "Light",
          ),
          Divider(height: 1),

          _SettingItem(
            icon: Icons.logout,
            title: "Sign Out",
            isDestructive: true,
            showArrow: false,
          ),
        ],
      ),
    );
  }
}

class _SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? value;
  final bool isDestructive;
  final bool showArrow;

  const _SettingItem({
    required this.icon,
    required this.title,
    this.value,
    this.isDestructive = false,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = isDestructive ? Colors.red : AppColors.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          // icon box
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isDestructive
                  ? Colors.red.withValues(alpha: 0.1)
                  : AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: primaryColor),
          ),

          const SizedBox(width: 12),

          // title
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
          ),

          // value (optional)
          if (value != null)
            Text(
              value!,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.primary.withValues(alpha: 0.7),
              ),
            ),

          if (showArrow) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right,
              color: AppColors.primary.withValues(alpha: 0.5),
            ),
          ],
        ],
      ),
    );
  }
}
