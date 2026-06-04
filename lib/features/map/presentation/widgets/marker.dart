import 'package:flutter/material.dart';
import 'package:jot_jai_app/core/theme/app_colors.dart';

class MapMarker extends StatelessWidget {
  final int count;

  const MapMarker({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.location_on,
          color: AppColors.amber900,
          size: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black26,
              ),
            ],
          ),
          child: Text(
            '$count',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}