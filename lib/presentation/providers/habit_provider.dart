import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/habit.dart';

final habitListProvider = StateNotifierProvider<HabitNotifier, List<Habit>>((ref) {
  return HabitNotifier();
});

class HabitNotifier extends StateNotifier<List<Habit>> {
  HabitNotifier() : super([]);

  final _uuid = const Uuid();

  Future<void> loadInitial(List<Habit> seed) async {
    state = seed;
  }

  Future<void> addHabit(String name, String icon, int color, int bg) async {
    final habit = Habit(
      id: _uuid.v4(),
      name: name,
      icon: icon,
      colorValue: color,
      bgColorValue: bg,
      sortOrder: state.length,
      createdAt: DateTime.now(),
    );
    state = [...state, habit];
  }

  Future<void> deleteHabit(String id) async {
    state = state.where((h) => h.id != id).toList();
  }
}
