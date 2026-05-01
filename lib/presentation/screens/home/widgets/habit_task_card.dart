import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

class HabitTaskCard extends StatelessWidget {
  final String title;
  final String type; // 'Habit', 'Task', 'Periodic task'
  final String time;
  final String? extraTag;
  final String icon;
  final Color iconColor;
  final Color iconBgColor;
  final Widget statusIcon;

  const HabitTaskCard({
    super.key,
    required this.title,
    required this.type,
    required this.time,
    this.extraTag,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.statusIcon,
    this.onEdit,
    this.onDelete,
    this.onArchive,
  });

  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onArchive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.paddingM),
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            ),
            child: Center(
              child: Text(
                icon,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    _buildTag(type, iconColor.withOpacity(0.1), iconColor),
                    if (extraTag != null) _buildTag(extraTag!, AppColors.primaryLight, AppColors.primary),
                    _buildTag(time, iconColor.withOpacity(0.1), iconColor, Icons.access_time),
                  ],
                ),
              ],
            ),
          ),
          statusIcon,
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: AppColors.textSecondary),
            onSelected: (value) {
              if (value == 'edit' && onEdit != null) onEdit!();
              if (value == 'delete' && onDelete != null) onDelete!();
              if (value == 'archive' && onArchive != null) onArchive!();
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'edit', child: Text('Edit')),
              const PopupMenuItem(value: 'archive', child: Text('Archive')),
              const PopupMenuItem(value: 'delete', child: Text('Delete', style: TextStyle(color: Colors.red))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color bgColor, Color textColor, [IconData? tagIcon]) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tagIcon != null) ...[
            Icon(tagIcon, size: 12, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
