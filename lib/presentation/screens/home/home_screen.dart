import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import 'widgets/week_calendar_strip.dart';
import 'widgets/category_pills.dart';
import 'widgets/habit_task_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime _selectedDate = DateTime.now();
  String _selectedCategory = 'Other';

  final _categories = ['Other', 'Health', 'Study', 'Work', 'Home', 'Art'];

  @override
  Widget build(BuildContext context) {
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
          child: const Text(
            'Today',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () {},
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
                  const Text(
                    '57%',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: 0.57,
                backgroundColor: AppColors.neutral,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const SizedBox(height: 24),
              
              // Dummy data matching the design since we don't have all the Riverpod providers wired up perfectly for tasks yet
              HabitTaskCard(
                title: 'Drink Water',
                type: 'Habit',
                time: '08:00 AM',
                icon: Icons.local_drink,
                iconColor: AppColors.habitRed,
                iconBgColor: AppColors.habitRedBg,
                statusIcon: Container(
                  width: 24, height: 24,
                  decoration: BoxDecoration(color: AppColors.neutral.withOpacity(0.5), shape: BoxShape.circle),
                ),
              ),
              HabitTaskCard(
                title: 'Avoid Junk Food',
                type: 'Habit',
                time: '09:00 AM',
                icon: Icons.fastfood,
                iconColor: AppColors.habitGreen,
                iconBgColor: AppColors.habitGreenBg,
                statusIcon: Container(
                  width: 24, height: 24,
                  decoration: const BoxDecoration(color: AppColors.failure, shape: BoxShape.circle),
                  child: const Icon(Icons.close, color: Colors.white, size: 16),
                ),
              ),
              HabitTaskCard(
                title: 'Read Pages',
                type: 'Habit',
                time: '12:00 PM',
                extraTag: '3/5 PAGES',
                icon: Icons.menu_book,
                iconColor: AppColors.habitPink,
                iconBgColor: AppColors.habitPinkBg,
                statusIcon: Container(
                  width: 24, height: 24,
                  decoration: const BoxDecoration(color: AppColors.skipped, shape: BoxShape.circle),
                  child: const Icon(Icons.more_horiz, color: Colors.white, size: 16),
                ),
              ),
              HabitTaskCard(
                title: 'Workout Session',
                type: 'Habit',
                time: '05:00 PM',
                extraTag: '1 min 39 secs',
                icon: Icons.fitness_center,
                iconColor: AppColors.habitBlue,
                iconBgColor: AppColors.habitBlueBg,
                statusIcon: Container(
                  width: 24, height: 24,
                  decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
              HabitTaskCard(
                title: 'Doctor Appointment',
                type: 'Task',
                time: '07:00 PM',
                icon: Icons.medical_services,
                iconColor: AppColors.habitRed,
                iconBgColor: AppColors.habitRedBg,
                statusIcon: Container(
                  width: 24, height: 24,
                  decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
              HabitTaskCard(
                title: 'Call parents Weekly',
                type: 'Periodic task',
                time: '07:00 PM',
                icon: Icons.home,
                iconColor: AppColors.habitPurple,
                iconBgColor: AppColors.habitPurpleBg,
                statusIcon: Container(
                  width: 24, height: 24,
                  decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
