import 'package:flutter/material.dart';

class AddHabitSheet extends StatelessWidget {
  const AddHabitSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      height: 500,
      child: const Center(
        child: Text('Add Habit Sheet'),
      ),
    );
  }
}
