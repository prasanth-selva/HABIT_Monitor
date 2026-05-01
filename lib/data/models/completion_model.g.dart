// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletionModelAdapter extends TypeAdapter<CompletionModel> {
  @override
  final int typeId = 1;

  @override
  CompletionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletionModel()
      ..dateKey = fields[0] as String
      ..habitId = fields[1] as String
      ..isDone = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, CompletionModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dateKey)
      ..writeByte(1)
      ..write(obj.habitId)
      ..writeByte(2)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
