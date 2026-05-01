import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class MoodChart extends StatelessWidget {
  const MoodChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Mood chart', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar('09:39 PM', 0.7, AppColors.success, Icons.sentiment_very_satisfied),
              _buildBar('09:40 PM', 0.3, AppColors.habitOrange, Icons.sentiment_dissatisfied),
              _buildBar('09:40 PM', 0.4, AppColors.skipped, Icons.sentiment_neutral),
              _buildBar('09:41 PM', 0.2, AppColors.failure, Icons.sentiment_very_dissatisfied),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBar(String time, double heightRatio, Color color, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 8),
        Container(
          width: 12,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 12,
            height: 100 * heightRatio,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(time, style: const TextStyle(fontSize: 8, color: AppColors.textSecondary)),
      ],
    );
  }
}
