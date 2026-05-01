import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String icon;

  @HiveField(3)
  late int colorValue;

  @HiveField(4)
  late int bgColorValue;

  @HiveField(5)
  late int sortOrder;

  @HiveField(6)
  late DateTime createdAt;
}
