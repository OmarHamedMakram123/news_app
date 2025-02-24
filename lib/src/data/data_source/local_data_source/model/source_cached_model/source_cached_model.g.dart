// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_cached_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourceCachedModelAdapter extends TypeAdapter<SourceCachedModel> {
  @override
  final int typeId = 1;

  @override
  SourceCachedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourceCachedModel(
      id: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SourceCachedModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceCachedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
