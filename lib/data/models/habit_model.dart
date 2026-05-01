import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0) late String id;
  @HiveField(1) late String name;
  @HiveField(2) late String icon;
  @HiveField(3) late int colorValue;
  @HiveField(4) late int bgColorValue;
  @HiveField(5) late String category;
  @HiveField(6) late String frequency;
  @HiveField(7) late bool isArchived;
  @HiveField(8) late int sortOrder;
  @HiveField(9) late DateTime createdAt;
  @HiveField(10) late String? reminderTime;

  HabitModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.colorValue,
    required this.bgColorValue,
    required this.category,
    required this.frequency,
    this.isArchived = false,
    this.sortOrder = 0,
    required this.createdAt,
    this.reminderTime,
  });
}
