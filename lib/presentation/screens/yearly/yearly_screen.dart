import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../providers/habit_provider.dart';
import '../../providers/completion_provider.dart';

class YearlyScreen extends ConsumerWidget {
  const YearlyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yearly Review'),
      ),
      body: habits.isEmpty
          ? const Center(child: Text("No habits added yet."))
          : ListView.builder(
              padding: const EdgeInsets.all(AppDimensions.paddingM),
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                final yearCompletion = ref.read(completionNotifierProvider.notifier).getYearCompletion(habit.id, DateTime.now().year);
                final bestStreak = ref.read(completionNotifierProvider.notifier).getBestStreak(habit.id);

                return Card(
                  margin: const EdgeInsets.only(bottom: AppDimensions.paddingM),
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.paddingM),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(habit.icon, style: const TextStyle(fontSize: 24)),
                            const SizedBox(width: 12),
                            Text(habit.name, style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Year Completion:', style: Theme.of(context).textTheme.bodyMedium),
                            Text('${(yearCompletion * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: yearCompletion,
                          backgroundColor: habit.color.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(habit.color),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Best Streak:', style: Theme.of(context).textTheme.bodyMedium),
                            Text('$bestStreak days', style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
