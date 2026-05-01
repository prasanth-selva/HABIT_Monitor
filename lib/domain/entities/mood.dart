class Mood {
  final String id;
  final int rating; // 1 to 5 (Awful to Awesome)
  final DateTime timestamp;
  final List<String> tags;
  final String? note;

  const Mood({
    required this.id,
    required this.rating,
    required this.timestamp,
    required this.tags,
    this.note,
  });
}
