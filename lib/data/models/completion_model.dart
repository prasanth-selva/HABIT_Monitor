import 'package:hive/hive.dart';

part 'completion_model.g.dart';

@HiveType(typeId: 2)
class CompletionModel extends HiveObject {
  @HiveField(0) late String dateKey;
  @HiveField(1) late String habitId;
  @HiveField(2) late int status; // 0=pending, 1=done, 2=failed, 3=skipped
  @HiveField(3) late DateTime? completedAt;

  CompletionModel({
    required this.dateKey,
    required this.habitId,
    required this.status,
    this.completedAt,
  });
}
