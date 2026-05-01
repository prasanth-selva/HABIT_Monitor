class Habit {
  final String id;
  final String name;
  final String icon;
  final int colorValue;
  final int bgColorValue;
  final int sortOrder;
  final DateTime createdAt;

  Habit({
    required this.id,
    required this.name,
    required this.icon,
    required this.colorValue,
    required this.bgColorValue,
    required this.sortOrder,
    required this.createdAt,
  });
}
