import '../../domain/entities/completion.dart';
import '../../domain/repositories/completion_repository.dart';
import '../datasources/local_datasource.dart';
import '../models/completion_model.dart';

class CompletionRepositoryImpl implements CompletionRepository {
  final LocalDataSource localDataSource;

  CompletionRepositoryImpl(this.localDataSource);

  @override
  Map<String, Map<String, bool>> getAll() {
    final models = localDataSource.getCompletions();
    final Map<String, Map<String, bool>> result = {};
    
    for (var model in models) {
      if (!result.containsKey(model.dateKey)) {
        result[model.dateKey] = {};
      }
      result[model.dateKey]![model.habitId] = model.isDone;
    }
    
    return result;
  }

  @override
  Future<void> toggle(String dateKey, String habitId) async {
    final models = localDataSource.getCompletions();
    final existing = models.where((m) => m.dateKey == dateKey && m.habitId == habitId).firstOrNull;
    
    if (existing != null) {
      existing.isDone = !existing.isDone;
      await localDataSource.addOrUpdateCompletion(existing);
    } else {
      final newModel = CompletionModel()
        ..dateKey = dateKey
        ..habitId = habitId
        ..isDone = true;
      await localDataSource.addOrUpdateCompletion(newModel);
    }
  }
}
