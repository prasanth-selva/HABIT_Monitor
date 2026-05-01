import 'package:hive/hive.dart';

part 'mood_entry_model.g.dart';

@HiveType(typeId: 3)
class MoodEntryModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late int mood; // 1=awful .. 5=awesome
  @HiveField(2) late List<String> tags;
  @HiveField(3) late String? note;
  @HiveField(4) late DateTime loggedAt;

  MoodEntryModel({
    required this.id,
    required this.mood,
    required this.tags,
    this.note,
    required this.loggedAt,
  });
}
