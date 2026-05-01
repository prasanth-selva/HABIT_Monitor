class AppTask {
  final String id;
  final String title;
  final DateTime dueDate;
  final bool isCompleted;
  final String type; // 'Task', 'Periodic task'
  final DateTime? time;
  final DateTime createdAt;

  const AppTask({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.isCompleted,
    required this.type,
    this.time,
    required this.createdAt,
  });
}
