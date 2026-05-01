import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/utils/date_utils.dart';

class HabitCalendar extends StatelessWidget {
  final DateTime month;
  final Map<String, bool> completions;
  final Color activeColor;

  const HabitCalendar({
    super.key,
    required this.month,
    required this.completions,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);
    final offset = firstDay.weekday % 7; // Sunday=0
    final totalDays = lastDay.day;
    final totalCells = offset + totalDays;
    final rows = (totalCells / 7).ceil();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: rows * 7,
      itemBuilder: (context, index) {
        if (index < offset || index >= offset + totalDays) {
          return const SizedBox.shrink();
        }

        final day = index - offset + 1;
        final currentDay = DateTime(month.year, month.month, day);
        final dateKey = AppDateUtils.dateKey(currentDay);
        final isDone = completions[dateKey] == true;
        final isToday = AppDateUtils.isSameDay(currentDay, DateTime.now());
        final isFuture = currentDay.isAfter(DateTime.now());

        return Container(
          decoration: BoxDecoration(
            color: isDone ? activeColor : (isFuture ? Colors.transparent : Theme.of(context).dividerColor.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
            border: isToday
                ? Border.all(color: activeColor, width: 2)
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            '$day',
            style: TextStyle(
              color: isDone ? Colors.white : (isFuture ? Theme.of(context).disabledColor : Theme.of(context).colorScheme.onSurface),
              fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      },
    );
  }
}
