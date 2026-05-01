import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/completion_repository.dart';
import '../../data/repositories/completion_repository_impl.dart';
import '../../core/utils/date_utils.dart';
import 'habit_provider.dart';

part 'completion_provider.g.dart';

@Riverpod(keepAlive: true)
CompletionRepository completionRepository(CompletionRepositoryRef ref) {
  final dataSource = ref.watch(localDataSourceProvider);
  return CompletionRepositoryImpl(dataSource);
}

@riverpod
class CompletionNotifier extends _$CompletionNotifier {
  @override
  Map<String, Map<String, bool>> build() {
    return ref.watch(completionRepositoryProvider).getAll();
  }

  Future<void> toggle(String dateKey, String habitId) async {
    await ref.read(completionRepositoryProvider).toggle(dateKey, habitId);
    state = ref.read(completionRepositoryProvider).getAll();
  }

  double getCompletionRate(String dateKey) {
    final habits = ref.read(habitNotifierProvider);
    if (habits.isEmpty) return 0.0;

    final dayCompletions = state[dateKey] ?? {};
    int completedCount = 0;
    for (var habit in habits) {
      if (dayCompletions[habit.id] == true) {
        completedCount++;
      }
    }
    return completedCount / habits.length;
  }

  int getCurrentStreak(String habitId) {
    int streak = 0;
    DateTime current = DateTime.now();
    bool keepGoing = true;

    while (keepGoing) {
      final dateKey = AppDateUtils.dateKey(current);
      final dayCompletions = state[dateKey] ?? {};
      final isDone = dayCompletions[habitId] ?? false;

      if (isDone) {
        streak++;
        current = current.subtract(const Duration(days: 1));
      } else {
        if (streak == 0) {
          final yesterday = current.subtract(const Duration(days: 1));
          final yKey = AppDateUtils.dateKey(yesterday);
          final yCompletions = state[yKey] ?? {};
          final yDone = yCompletions[habitId] ?? false;

          if (yDone) {
            current = yesterday;
          } else {
            keepGoing = false;
          }
        } else {
          keepGoing = false;
        }
      }
    }
    return streak;
  }

  int getBestStreak(String habitId) {
    int maxStreak = 0;
    int currentStreak = 0;
    
    final allDates = state.keys.toList()..sort();
    if (allDates.isEmpty) return 0;
    
    DateTime? lastDate;

    for (var dateKey in allDates) {
      final isDone = state[dateKey]?[habitId] == true;
      if (isDone) {
        final dateParts = dateKey.split('-');
        final currentDate = DateTime(int.parse(dateParts[0]), int.parse(dateParts[1]), int.parse(dateParts[2]));

        if (lastDate == null) {
          currentStreak = 1;
        } else {
          final diff = currentDate.difference(lastDate).inDays;
          if (diff == 1) {
            currentStreak++;
          } else if (diff > 1) {
            currentStreak = 1;
          }
        }
        if (currentStreak > maxStreak) {
          maxStreak = currentStreak;
        }
        lastDate = currentDate;
      }
    }

    return maxStreak;
  }

  double getYearCompletion(String habitId, int year) {
    int totalCompleted = 0;
    
    state.forEach((dateKey, completions) {
      if (dateKey.startsWith('$year') && completions[habitId] == true) {
        totalCompleted++;
      }
    });

    return totalCompleted / 365.0;
  }
}
