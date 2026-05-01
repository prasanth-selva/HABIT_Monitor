import '../entities/completion.dart';

abstract class CompletionRepository {
  Map<String, Map<String, bool>> getAll();
  Future<void> toggle(String dateKey, String habitId);
}
