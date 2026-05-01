import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/completion.dart';
import '../../core/utils/date_utils.dart';

final completionProvider = StateNotifierProvider<CompletionNotifier, Map<String, Map<String, bool>>>((ref) {
  return CompletionNotifier();
});

class CompletionNotifier extends StateNotifier<Map<String, Map<String, bool>>> {
  CompletionNotifier() : super({});

  Map<String, bool> _mapForDate(String dateKey) => state[dateKey] ?? {};

  Future<void> toggle(String dateKey, String habitId) async {
    final map = Map<String, bool>.from(_mapForDate(dateKey));
    map[habitId] = !(map[habitId] ?? false);
    state = {...state, dateKey: map};
  }

  double getCompletionRate(String dateKey) {
    final map = _mapForDate(dateKey);
    if (map.isEmpty) return 0.0;
    final done = map.values.where((v) => v).length;
    return done / map.length;
  }

  int getCurrentStreak(String habitId) {
    // Placeholder simple implementation for now
    return 0;
  }

  int getBestStreak(String habitId) {
    return 0;
  }
}
