import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/completion_model.dart';
import 'habit_provider.dart';

part 'completion_provider.g.dart';

@riverpod
class CompletionNotifier extends _$CompletionNotifier {
  @override
  Map<String, Map<String, CompletionModel>> build() {
    final completions = ref.watch(localDataSourceProvider).getCompletions();
    Map<String, Map<String, CompletionModel>> map = {};
    for (var c in completions) {
      if (!map.containsKey(c.dateKey)) {
        map[c.dateKey] = {};
      }
      map[c.dateKey]![c.habitId] = c;
    }
    return map;
  }

  Future<void> setStatus(String dateKey, String habitId, int status) async {
    final completion = CompletionModel(
      dateKey: dateKey,
      habitId: habitId,
      status: status,
      completedAt: DateTime.now(),
    );
    await ref.read(localDataSourceProvider).addOrUpdateCompletion(completion);
    
    // Refresh state
    final completions = ref.read(localDataSourceProvider).getCompletions();
    Map<String, Map<String, CompletionModel>> map = {};
    for (var c in completions) {
      if (!map.containsKey(c.dateKey)) {
        map[c.dateKey] = {};
      }
      map[c.dateKey]![c.habitId] = c;
    }
    state = map;
  }
}
