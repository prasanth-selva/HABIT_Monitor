import 'package:hive/hive.dart';
import '../models/habit_model.dart';
import '../models/completion_model.dart';

class LocalDataSource {
  static const String habitBoxName = 'habits';
  static const String completionBoxName = 'completions';

  Box<HabitModel> get habitBox => Hive.box<HabitModel>(habitBoxName);
  Box<CompletionModel> get completionBox => Hive.box<CompletionModel>(completionBoxName);

  Future<void> init() async {
    if (!Hive.isBoxOpen(habitBoxName)) {
      await Hive.openBox<HabitModel>(habitBoxName);
    }
    if (!Hive.isBoxOpen(completionBoxName)) {
      await Hive.openBox<CompletionModel>(completionBoxName);
    }
  }

  List<HabitModel> getHabits() => habitBox.values.toList()..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  Future<void> addHabit(HabitModel habit) async {
    await habitBox.put(habit.id, habit);
  }

  Future<void> deleteHabit(String id) async {
    await habitBox.delete(id);
  }
  
  Future<void> updateHabit(HabitModel habit) async {
    await habit.save();
  }

  List<CompletionModel> getCompletions() => completionBox.values.toList();

  Future<void> addOrUpdateCompletion(CompletionModel completion) async {
    final key = '${completion.dateKey}_${completion.habitId}';
    await completionBox.put(key, completion);
  }
}
