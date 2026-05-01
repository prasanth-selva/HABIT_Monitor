import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../domain/entities/habit.dart';
import '../../../../core/constants/app_dimensions.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;
  final bool isDone;
  final int streak;
  final VoidCallback onToggle;

  const HabitCard({
    super.key,
    required this.habit,
    required this.isDone,
    required this.streak,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        onToggle();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isDone ? habit.bgColor : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
          border: Border.all(
            color: isDone ? habit.color : theme.dividerColor.withOpacity(0.1),
            width: 2,
          ),
          boxShadow: [
            if (!isDone)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  habit.icon,
                  style: const TextStyle(fontSize: 28),
                ),
                _AnimatedCheckbox(
                  isDone: isDone,
                  color: habit.color,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  habit.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (streak > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: habit.color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🔥', style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 4),
                        Text(
                          '$streak day streak',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: habit.color,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ).animate().scale(curve: Curves.easeOutBack),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedCheckbox extends StatelessWidget {
  final bool isDone;
  final Color color;

  const _AnimatedCheckbox({required this.isDone, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDone ? color : Colors.transparent,
        border: Border.all(
          color: isDone ? color : Theme.of(context).dividerColor,
          width: 2,
        ),
      ),
      child: isDone
          ? const Icon(Icons.check, color: Colors.white, size: 18)
              .animate()
              .scale(curve: Curves.elasticOut)
          : null,
    );
  }
}
