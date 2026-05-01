import 'package:hive/hive.dart';

part 'completion_model.g.dart';

@HiveType(typeId: 1)
class CompletionModel extends HiveObject {
  @HiveField(0) late String dateKey;
  @HiveField(1) late String habitId;
  @HiveField(2) late bool isDone;
}
