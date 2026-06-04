import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class RealtimeStatusmap extends StatefulWidget {
  const RealtimeStatusmap({super.key});

  @override
  State<RealtimeStatusmap> createState() => _RealtimeStatusmapState();
}

class _RealtimeStatusmapState extends State<RealtimeStatusmap>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.softBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          FadeTransition(
            opacity: _animation,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Text(
              "483 meditating in Thailand",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Map ',
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    )
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment
                        .middle, // กำหนดตำแหน่งความสูงของ Icon
                    child: Icon(Icons.arrow_forward, size: 16, color: AppColors.primaryLight),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
