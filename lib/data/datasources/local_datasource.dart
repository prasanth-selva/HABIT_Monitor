import 'package:hive/hive.dart';
import '../models/habit_model.dart';
import '../models/completion_model.dart';
import '../models/task_model.dart';
import '../models/mood_model.dart';
import '../models/transaction_model.dart';

class LocalDataSource {
  static const String habitBoxName = 'habits';
  static const String completionBoxName = 'completions';
  static const String taskBoxName = 'tasks';
  static const String moodBoxName = 'moods';
  static const String transactionBoxName = 'transactions';

  Box<HabitModel> get habitBox => Hive.box<HabitModel>(habitBoxName);
  Box<CompletionModel> get completionBox => Hive.box<CompletionModel>(completionBoxName);
  Box<TaskModel> get taskBox => Hive.box<TaskModel>(taskBoxName);
  Box<MoodModel> get moodBox => Hive.box<MoodModel>(moodBoxName);
  Box<TransactionModel> get transactionBox => Hive.box<TransactionModel>(transactionBoxName);

  Future<void> init() async {
    if (!Hive.isBoxOpen(habitBoxName)) {
      await Hive.openBox<HabitModel>(habitBoxName);
    }
    if (!Hive.isBoxOpen(completionBoxName)) {
      await Hive.openBox<CompletionModel>(completionBoxName);
    }
    if (!Hive.isBoxOpen(taskBoxName)) {
      await Hive.openBox<TaskModel>(taskBoxName);
    }
    if (!Hive.isBoxOpen(moodBoxName)) {
      await Hive.openBox<MoodModel>(moodBoxName);
    }
    if (!Hive.isBoxOpen(transactionBoxName)) {
      await Hive.openBox<TransactionModel>(transactionBoxName);
    }
  }

  // Habits
  List<HabitModel> getHabits() => habitBox.values.toList()..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  Future<void> addHabit(HabitModel habit) async => await habitBox.put(habit.id, habit);
  Future<void> deleteHabit(String id) async => await habitBox.delete(id);
  Future<void> updateHabit(HabitModel habit) async => await habit.save();

  // Completions
  List<CompletionModel> getCompletions() => completionBox.values.toList();
  Future<void> addOrUpdateCompletion(CompletionModel completion) async {
    final key = '${completion.dateKey}_${completion.habitId}';
    await completionBox.put(key, completion);
  }

  // Tasks
  List<TaskModel> getTasks() => taskBox.values.toList();
  Future<void> addTask(TaskModel task) async => await taskBox.put(task.id, task);
  Future<void> deleteTask(String id) async => await taskBox.delete(id);

  // Moods
  List<MoodModel> getMoods() => moodBox.values.toList();
  Future<void> addMood(MoodModel mood) async => await moodBox.put(mood.id, mood);
  Future<void> deleteMood(String id) async => await moodBox.delete(id);

  // Transactions
  List<TransactionModel> getTransactions() => transactionBox.values.toList();
  Future<void> addTransaction(TransactionModel transaction) async => await transactionBox.put(transaction.id, transaction);
  Future<void> deleteTransaction(String id) async => await transactionBox.delete(id);
}
