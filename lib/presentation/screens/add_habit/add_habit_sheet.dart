import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../data/models/habit_model.dart';
import '../../providers/habit_provider.dart';
import 'widgets/color_picker_row.dart';
import 'widgets/icon_picker_grid.dart';

class AddHabitSheet extends ConsumerStatefulWidget {
  const AddHabitSheet({super.key});

  @override
  ConsumerState<AddHabitSheet> createState() => _AddHabitSheetState();
}

class _AddHabitSheetState extends ConsumerState<AddHabitSheet> {
  final _nameController = TextEditingController();
  
  final List<Color> _colors = [
    AppColors.habitRed,
    AppColors.habitGreen,
    AppColors.habitPink,
    AppColors.habitBlue,
    AppColors.habitPurple,
    AppColors.habitOrange,
  ];
  
  final Map<Color, Color> _bgColors = {
    AppColors.habitRed: AppColors.habitRedBg,
    AppColors.habitGreen: AppColors.habitGreenBg,
    AppColors.habitPink: AppColors.habitPinkBg,
    AppColors.habitBlue: AppColors.habitBlueBg,
    AppColors.habitPurple: AppColors.habitPurpleBg,
    AppColors.habitOrange: AppColors.habitOrangeBg,
  };

  final _icons = [
    '💪', '📚', '🧘', '💧', '🌙', '🥗', '🚶', '🍎', '💻', '🎨', '🎸', '🗣️',
    '📝', '🧠', '💼', '💵', '🌱', '☀️'
  ];

  late Color _selectedColor;
  late String _selectedIcon;

  @override
  void initState() {
    super.initState();
    _selectedColor = _colors[0];
    _selectedIcon = _icons[0];
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _saveHabit() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final habit = HabitModel(
      id: const Uuid().v4(),
      name: name,
      icon: _selectedIcon,
      colorValue: _selectedColor.value,
      bgColorValue: _bgColors[_selectedColor]!.value,
      category: 'Other', // default category
      frequency: 'daily', // default frequency
      sortOrder: ref.read(habitNotifierProvider).length,
      createdAt: DateTime.now(),
    );

    ref.read(habitNotifierProvider.notifier).addHabit(habit);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.dividerColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Create New Habit', style: theme.textTheme.headlineMedium),
            const SizedBox(height: 24),
            
            // Name Input
            TextField(
              controller: _nameController,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'e.g. Morning workout',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  borderSide: BorderSide(color: theme.dividerColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  borderSide: BorderSide(color: theme.dividerColor.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
                  borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
                ),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHighest?.withOpacity(0.3) ?? theme.colorScheme.surface,
              ),
            ),
            
            const SizedBox(height: 24),
            Text('Choose Icon', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            IconPickerGrid(
              icons: _icons,
              selectedIcon: _selectedIcon,
              onIconSelected: (icon) => setState(() => _selectedIcon = icon),
            ),
            
            const SizedBox(height: 24),
            Text('Choose Color', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ColorPickerRow(
              colors: _colors,
              selectedColor: _selectedColor,
              onColorSelected: (color) => setState(() => _selectedColor = color),
            ),
            
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _saveHabit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
                  ),
                  elevation: 0,
                ),
                child: const Text('Add Habit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
