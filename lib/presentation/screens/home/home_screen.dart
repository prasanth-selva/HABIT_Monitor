import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import 'widgets/week_calendar_strip.dart';
import 'widgets/category_pills.dart';
import 'widgets/habit_task_card.dart';
import '../../providers/habit_provider.dart';
import '../../providers/completion_provider.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = 'All';

  final _categories = ['All', 'Health', 'Study', 'Work', 'Home', 'Art', 'Other'];

  @override
  Widget build(BuildContext context) {
    final habits = ref.watch(habitNotifierProvider);
    final completions = ref.watch(completionNotifierProvider);

    final dateKey = DateFormat('yyyy-MM-dd').format(_selectedDate);
    final dayCompletions = completions[dateKey] ?? {};

    // Filter by category
    final filteredHabits = habits.where((h) => _selectedCategory == 'All' || h.category == _selectedCategory).toList();

    // Calculate progress
    int completedCount = 0;
    for (var h in filteredHabits) {
      if (dayCompletions[h.id]?.status == 1) completedCount++;
    }
    double progress = filteredHabits.isEmpty ? 0 : completedCount / filteredHabits.length;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            DateFormat('MMMM d').format(_selectedDate),
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () {
              setState(() => _selectedDate = DateTime.now()); // reset to today
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeekCalendarStrip(
                selectedDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() => _selectedDate = date);
                },
              ),
              const SizedBox(height: 16),
              CategoryPills(
                categories: _categories,
                selectedCategory: _selectedCategory,
                onCategorySelected: (cat) {
                  setState(() => _selectedCategory = cat);
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progress',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '${(progress * 100).toInt()}%',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.neutral,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 24),
              
              if (filteredHabits.isEmpty)
                const Center(child: Text('No habits found for this category.'))
              else
                ...filteredHabits.map((habit) {
                  final status = dayCompletions[habit.id]?.status ?? 0;
                  Widget statusIcon;
                  if (status == 1) {
                    statusIcon = Container(
                      width: 24, height: 24,
                      decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                      child: const Icon(Icons.check, color: Colors.white, size: 16),
                    );
                  } else if (status == 2) {
                    statusIcon = Container(
                      width: 24, height: 24,
                      decoration: const BoxDecoration(color: AppColors.failure, shape: BoxShape.circle),
                      child: const Icon(Icons.close, color: Colors.white, size: 16),
                    );
                  } else if (status == 3) {
                    statusIcon = Container(
                      width: 24, height: 24,
                      decoration: const BoxDecoration(color: AppColors.skipped, shape: BoxShape.circle),
                      child: const Icon(Icons.more_horiz, color: Colors.white, size: 16),
                    );
                  } else {
                    statusIcon = Container(
                      width: 24, height: 24,
                      decoration: BoxDecoration(border: Border.all(color: AppColors.neutral, width: 2), shape: BoxShape.circle),
                    );
                  }

                  return InkWell(
                    onTap: () {
                      // Cycle status: 0 -> 1 -> 2 -> 3 -> 0
                      int nextStatus = (status + 1) % 4;
                      ref.read(completionNotifierProvider.notifier).setStatus(dateKey, habit.id, nextStatus);
                    },
                    child: HabitTaskCard(
                      title: habit.name,
                      type: 'Habit',
                      time: habit.frequency ?? 'Daily',
                      icon: habit.icon, // Passing the emoji string
                      iconColor: Color(habit.colorValue),
                      iconBgColor: Color(habit.bgColorValue),
                      statusIcon: statusIcon,
                      onDelete: () {
                        ref.read(habitNotifierProvider.notifier).deleteHabit(habit.id);
                      },
                      onArchive: () {
                        ref.read(habitNotifierProvider.notifier).archiveHabit(habit.id);
                      },
                      onEdit: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Edit habit coming soon!')),
                        );
                      },
                    ),
                  );
                }),
              
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
