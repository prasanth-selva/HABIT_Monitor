import '../entities/habit.dart';

abstract class HabitRepository {
  List<Habit> getHabits();
  Future<void> addHabit(Habit habit);
  Future<void> deleteHabit(String id);
  Future<void> reorderHabits(int oldIndex, int newIndex);
}
