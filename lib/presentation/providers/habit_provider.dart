import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/local_datasource.dart';
import '../../data/models/habit_model.dart';

part 'habit_provider.g.dart';

@Riverpod(keepAlive: true)
LocalDataSource localDataSource(LocalDataSourceRef ref) {
  throw UnimplementedError('localDataSource must be overridden in ProviderScope');
}

@riverpod
class HabitNotifier extends _$HabitNotifier {
  @override
  List<HabitModel> build() {
    return ref.watch(localDataSourceProvider).getHabits();
  }

  Future<void> addHabit(HabitModel habit) async {
    await ref.read(localDataSourceProvider).addHabit(habit);
    state = ref.read(localDataSourceProvider).getHabits();
  }

  Future<void> deleteHabit(String id) async {
    await ref.read(localDataSourceProvider).deleteHabit(id);
    state = ref.read(localDataSourceProvider).getHabits();
  }

  Future<void> archiveHabit(String id) async {
    final habit = state.firstWhere((h) => h.id == id);
    habit.isArchived = true;
    await ref.read(localDataSourceProvider).updateHabit(habit);
    state = ref.read(localDataSourceProvider).getHabits();
  }
}
