import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../providers/habit_provider.dart';
import '../../providers/completion_provider.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completionsMap = ref.watch(completionNotifierProvider);
    final habits = ref.watch(habitNotifierProvider);
    
    int done = 0;
    int failed = 0;
    int skipped = 0;

    List<Map<String, String>> failures = [];

    for (var dateKey in completionsMap.keys) {
      final dateCompletions = completionsMap[dateKey]!;
      for (var habitId in dateCompletions.keys) {
        final comp = dateCompletions[habitId]!;
        if (comp.status == 1) done++;
        if (comp.status == 2) {
          failed++;
          final habit = habits.firstWhere((h) => h.id == habitId, orElse: () => habits.first);
          failures.add({'date': dateKey, 'habit': '${habit.icon} ${habit.name}'});
        }
        if (comp.status == 3) skipped++;
      }
    }
    
    // Sort failures by date descending
    failures.sort((a, b) => b['date']!.compareTo(a['date']!));

    final total = done + failed + skipped;
    final double donePercent = total == 0 ? 0 : (done / total) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Habit Success Rate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('${donePercent.toStringAsFixed(1)}%', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 24),
            
            // PIE CHART
            SizedBox(
              height: 200,
              child: total == 0 
                ? const Center(child: Text('No data yet'))
                : PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 60,
                      sections: [
                        if (done > 0)
                          PieChartSectionData(
                            color: AppColors.success,
                            value: done.toDouble(),
                            title: '$done\nDone',
                            radius: 50,
                            titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        if (failed > 0)
                          PieChartSectionData(
                            color: AppColors.failure,
                            value: failed.toDouble(),
                            title: '$failed\nFailed',
                            radius: 40,
                            titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        if (skipped > 0)
                          PieChartSectionData(
                            color: AppColors.skipped,
                            value: skipped.toDouble(),
                            title: '$skipped\nSkip',
                            radius: 40,
                            titleStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                      ],
                    ),
                  ),
            ),
            
            const SizedBox(height: 48),
            const Text('Mood Trends (Dummy Bar Chart)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),

            // BAR CHART
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 5,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                          if (value.toInt() >= 0 && value.toInt() < days.length) {
                            return Text(days[value.toInt()]);
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 4, color: AppColors.moodGood, width: 16, borderRadius: BorderRadius.circular(4))]),
                    BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 5, color: AppColors.moodAwesome, width: 16, borderRadius: BorderRadius.circular(4))]),
                    BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 3, color: AppColors.moodNeutral, width: 16, borderRadius: BorderRadius.circular(4))]),
                    BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 2, color: AppColors.moodBad, width: 16, borderRadius: BorderRadius.circular(4))]),
                    BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 4, color: AppColors.moodGood, width: 16, borderRadius: BorderRadius.circular(4))]),
                    BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 4.5, color: AppColors.moodAwesome, width: 16, borderRadius: BorderRadius.circular(4))]),
                    BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 5, color: AppColors.moodAwesome, width: 16, borderRadius: BorderRadius.circular(4))]),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 48),
            const Text('Recent Failures', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            if (failures.isEmpty)
              const Text('No failures yet! Keep it up! 🎉', style: TextStyle(color: AppColors.textSecondary))
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: failures.length > 5 ? 5 : failures.length, // Show top 5
                itemBuilder: (context, index) {
                  final failure = failures[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.failure.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close, color: AppColors.failure, size: 20),
                    ),
                    title: Text(failure['habit']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(failure['date']!),
                  );
                },
              ),
            
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
