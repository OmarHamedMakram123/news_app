// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_cached_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsCachedModelAdapter extends TypeAdapter<NewsCachedModel> {
  @override
  final int typeId = 2;

  @override
  NewsCachedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsCachedModel(
      sourceName: fields[8] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      author: fields[3] as String,
      url: fields[4] as String,
      urlToImage: fields[5] as String,
      publishedAt: fields[6] as String,
      content: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsCachedModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlToImage)
      ..writeByte(6)
      ..write(obj.publishedAt)
      ..writeByte(7)
      ..write(obj.content)
      ..writeByte(8)
      ..write(obj.sourceName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsCachedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
