import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/mood_entry_model.dart';
import 'habit_provider.dart';

part 'mood_provider.g.dart';

@riverpod
class MoodNotifier extends _$MoodNotifier {
  @override
  List<MoodEntryModel> build() {
    return ref.watch(localDataSourceProvider).getMoods();
  }

  Future<void> logMood(MoodEntryModel entry) async {
    await ref.read(localDataSourceProvider).addMood(entry);
    state = ref.read(localDataSourceProvider).getMoods();
  }

  Future<void> deleteMood(String id) async {
    await ref.read(localDataSourceProvider).deleteMood(id);
    state = ref.read(localDataSourceProvider).getMoods();
  }
}
