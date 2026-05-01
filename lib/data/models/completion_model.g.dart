// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletionModelAdapter extends TypeAdapter<CompletionModel> {
  @override
  final int typeId = 2;

  @override
  CompletionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletionModel(
      dateKey: fields[0] as String,
      habitId: fields[1] as String,
      status: fields[2] as int,
      completedAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CompletionModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dateKey)
      ..writeByte(1)
      ..write(obj.habitId)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.completedAt);
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
