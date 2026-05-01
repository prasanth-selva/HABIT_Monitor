import 'package:flutter/material.dart';
import '../../domain/entities/habit.dart';
import '../../domain/repositories/habit_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/habit_model.dart';

class HabitRepositoryImpl implements HabitRepository {
  final LocalDataSource localDataSource;

  HabitRepositoryImpl(this.localDataSource);

  @override
  List<Habit> getHabits() {
    final models = localDataSource.getHabits();
    return models.map((m) => Habit(
      id: m.id,
      name: m.name,
      icon: m.icon,
      color: Color(m.colorValue),
      bgColor: Color(m.bgColorValue),
      sortOrder: m.sortOrder,
      createdAt: m.createdAt,
    )).toList();
  }

  @override
  Future<void> addHabit(Habit habit) async {
    final model = HabitModel()
      ..id = habit.id
      ..name = habit.name
      ..icon = habit.icon
      ..colorValue = habit.color.value
      ..bgColorValue = habit.bgColor.value
      ..sortOrder = habit.sortOrder
      ..createdAt = habit.createdAt;
    await localDataSource.addHabit(model);
  }

  @override
  Future<void> deleteHabit(String id) async {
    await localDataSource.deleteHabit(id);
  }

  @override
  Future<void> reorderHabits(int oldIndex, int newIndex) async {
    final habits = localDataSource.getHabits();
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = habits.removeAt(oldIndex);
    habits.insert(newIndex, item);
    
    for (int i = 0; i < habits.length; i++) {
      habits[i].sortOrder = i;
      await localDataSource.updateHabit(habits[i]);
    }
  }
}
