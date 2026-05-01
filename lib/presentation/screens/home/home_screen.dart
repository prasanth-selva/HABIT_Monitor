import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/utils/date_utils.dart';
import '../../providers/habit_provider.dart';
import '../../providers/completion_provider.dart';
import 'widgets/habit_card.dart';
import 'widgets/progress_ring.dart';
import 'widgets/daily_stats_row.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final today = DateTime.now();
    final todayKey = AppDateUtils.dateKey(today);
    
    final habits = ref.watch(habitNotifierProvider);
    final completions = ref.watch(completionNotifierProvider);
    final todayCompletions = completions[todayKey] ?? {};
    
    final completedCount = habits.where((h) => todayCompletions[h.id] == true).length;
    final totalCount = habits.length;
    final rate = ref.read(completionNotifierProvider.notifier).getCompletionRate(todayKey);
    
    int bestOverallStreak = 0;
    for (var h in habits) {
      final s = ref.read(completionNotifierProvider.notifier).getBestStreak(h.id);
      if (s > bestOverallStreak) bestOverallStreak = s;
    }

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Streakly', style: theme.textTheme.headlineMedium),
            Text(
              DateFormat('EEEE, MMMM d').format(today),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/settings');
            },
          )
        ],
      ),
      body: SafeArea(
        child: habits.isEmpty 
            ? const Center(child: Text("No habits yet. Tap + to add one!"))
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimensions.paddingM),
                      child: Column(
                        children: [
                          DailyStatsRow(
                            completed: completedCount,
                            total: totalCount,
                            rate: rate,
                            bestStreak: bestOverallStreak,
                          ),
                          const SizedBox(height: AppDimensions.paddingL),
                          ProgressRing(progress: rate),
                          const SizedBox(height: AppDimensions.paddingL),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.85,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final habit = habits[index];
                          final isDone = todayCompletions[habit.id] == true;
                          final streak = ref.read(completionNotifierProvider.notifier).getCurrentStreak(habit.id);
                          
                          return HabitCard(
                            habit: habit,
                            isDone: isDone,
                            streak: streak,
                            onToggle: () {
                              ref.read(completionNotifierProvider.notifier).toggle(todayKey, habit.id);
                            },
                          ).animate().fadeIn(delay: Duration(milliseconds: index * 50)).slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic);
                        },
                        childCount: habits.length,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                ],
              ),
      ),
    );
  }
}
