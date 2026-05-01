import 'package:hive/hive.dart';
import '../../domain/entities/mood.dart';

part 'mood_model.g.dart';

@HiveType(typeId: 3)
class MoodModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final int rating;

  @HiveField(2)
  final DateTime timestamp;

  @HiveField(3)
  final List<String> tags;

  @HiveField(4)
  final String? note;

  MoodModel({
    required this.id,
    required this.rating,
    required this.timestamp,
    required this.tags,
    this.note,
  });

  factory MoodModel.fromEntity(Mood entity) {
    return MoodModel(
      id: entity.id,
      rating: entity.rating,
      timestamp: entity.timestamp,
      tags: entity.tags,
      note: entity.note,
    );
  }

  Mood toEntity() {
    return Mood(
      id: id,
      rating: rating,
      timestamp: timestamp,
      tags: tags,
      note: note,
    );
  }
}
