import 'package:hive/hive.dart';
import '../models/habit_model.dart';
import '../models/completion_model.dart';

class LocalDatasource {
  static const String habitBox = 'habits';
  static const String completionBox = 'completions';

  Future<void> init() async {
    await Hive.openBox<HabitModel>(habitBox);
    await Hive.openBox<CompletionModel>(completionBox);
  }

  Box<HabitModel> getHabitBox() => Hive.box<HabitModel>(habitBox);
  Box<CompletionModel> getCompletionBox() => Hive.box<CompletionModel>(completionBox);
}
