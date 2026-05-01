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

    _selectedHabitId ??= 'overview';
    final selectedHabitColor = _selectedHabitId == 'overview' 
      ? Theme.of(context).colorScheme.primary 
      : Color(habits.firstWhere((h) => h.id == _selectedHabitId).colorValue);

    // Calculate completions
    final Map<String, int> dayStates = {};
    
    if (_selectedHabitId == 'overview') {
      allCompletions.forEach((dateKey, dayCompletions) {
        if (dateKey.startsWith("${_currentMonth.year}-${_currentMonth.month.toString().padLeft(2, '0')}")) {
          int done = 0;
          for (var habit in habits) {
            if (dayCompletions[habit.id]?.status == 1) done++;
          }
          if (done == habits.length && habits.isNotEmpty) {
            dayStates[dateKey] = 1; // Perfect
          } else if (done == 0 && habits.isNotEmpty) {
            dayStates[dateKey] = 2; // Critical
          } else if (done > 0) {
            dayStates[dateKey] = 3; // Partial
          }
        }
      });
    } else {
      allCompletions.forEach((dateKey, dayCompletions) {
        if (dateKey.startsWith("${_currentMonth.year}-${_currentMonth.month.toString().padLeft(2, '0')}")) {
          if (dayCompletions[_selectedHabitId]?.status == 1) {
            dayStates[dateKey] = 3; // Use partial color (habit color) for specific habit completions
          }
        }
      });
    }

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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: const Text('📊 Overview'),
                        selected: _selectedHabitId == 'overview',
                        onSelected: (selected) {
                          if (selected) setState(() => _selectedHabitId = 'overview');
                        },
                        selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                        labelStyle: TextStyle(
                          color: _selectedHabitId == 'overview' ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
                          fontWeight: _selectedHabitId == 'overview' ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    ...habits.map((h) {
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
                  ],
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
                dayStates: dayStates,
                activeColor: selectedHabitColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
