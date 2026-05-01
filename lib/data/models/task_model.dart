import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final DateTime dueDate;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final String type;

  @HiveField(5)
  final DateTime? time;

  @HiveField(6)
  final DateTime createdAt;

  TaskModel({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.isCompleted,
    required this.type,
    this.time,
    required this.createdAt,
  });
}
