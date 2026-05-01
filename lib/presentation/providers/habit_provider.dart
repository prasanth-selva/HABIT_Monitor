import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/habit.dart';
import '../../domain/repositories/habit_repository.dart';
import '../../data/datasources/local_datasource.dart';
import '../../data/repositories/habit_repository_impl.dart';

part 'habit_provider.g.dart';

@Riverpod(keepAlive: true)
LocalDataSource localDataSource(LocalDataSourceRef ref) {
  throw UnimplementedError('Initialized in main');
}

@Riverpod(keepAlive: true)
HabitRepository habitRepository(HabitRepositoryRef ref) {
  final dataSource = ref.watch(localDataSourceProvider);
  return HabitRepositoryImpl(dataSource);
}

@riverpod
class HabitNotifier extends _$HabitNotifier {
  @override
  List<Habit> build() {
    return ref.watch(habitRepositoryProvider).getHabits();
  }

  Future<void> addHabit(Habit habit) async {
    await ref.read(habitRepositoryProvider).addHabit(habit);
    state = ref.read(habitRepositoryProvider).getHabits();
  }

  Future<void> deleteHabit(String id) async {
    await ref.read(habitRepositoryProvider).deleteHabit(id);
    state = ref.read(habitRepositoryProvider).getHabits();
  }

  Future<void> reorderHabits(int oldIndex, int newIndex) async {
    await ref.read(habitRepositoryProvider).reorderHabits(oldIndex, newIndex);
    state = ref.read(habitRepositoryProvider).getHabits();
  }
}
