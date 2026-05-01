import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../providers/habit_provider.dart';
import '../../providers/completion_provider.dart';
import 'widgets/habit_calendar.dart';

class MonthlyScreen extends ConsumerStatefulWidget {
  const MonthlyScreen({super.key});

  @override
  ConsumerState<MonthlyScreen> createState() => _MonthlyScreenState();
}

class _MonthlyScreenState extends ConsumerState<MonthlyScreen> {
  DateTime _currentMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
  String? _selectedHabitId;

  @override
  Widget build(BuildContext context) {
    final habits = ref.watch(habitNotifierProvider);
    final allCompletions = ref.watch(completionNotifierProvider);

    if (habits.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Monthly')),
        body: const Center(child: Text("No habits added yet.")),
      );
    }

    _selectedHabitId ??= habits.first.id;
    final selectedHabit = habits.firstWhere((h) => h.id == _selectedHabitId);

    // Extract completions for the selected habit for this month
    final Map<String, bool> habitCompletions = {};
    allCompletions.forEach((dateKey, dayCompletions) {
      if (dateKey.startsWith("${_currentMonth.year}-${_currentMonth.month.toString().padLeft(2, '0')}")) {
        if (dayCompletions[_selectedHabitId]?.status == 1) {
          habitCompletions[dateKey] = true;
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Habit selector
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: habits.map((h) {
                    final isSelected = h.id == _selectedHabitId;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text('${h.icon} ${h.name}'),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _selectedHabitId = h.id);
                          }
                        },
                        selectedColor: Color(h.colorValue).withOpacity(0.2),
                        labelStyle: TextStyle(
                          color: isSelected ? Color(h.colorValue) : Theme.of(context).colorScheme.onSurface,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),
              
              // Month navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
                      });
                    },
                  ),
                  Text(
                    DateFormat('MMMM yyyy').format(_currentMonth),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              HabitCalendar(
                month: _currentMonth,
                completions: habitCompletions,
                activeColor: Color(selectedHabit.colorValue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
