import 'package:hive/hive.dart';
import '../../domain/entities/task.dart';

part 'task_model.g.dart';

@HiveType(typeId: 2)
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

  factory TaskModel.fromEntity(AppTask entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      dueDate: entity.dueDate,
      isCompleted: entity.isCompleted,
      type: entity.type,
      time: entity.time,
      createdAt: entity.createdAt,
    );
  }

  AppTask toEntity() {
    return AppTask(
      id: id,
      title: title,
      dueDate: dueDate,
      isCompleted: isCompleted,
      type: type,
      time: time,
      createdAt: createdAt,
    );
  }
}
