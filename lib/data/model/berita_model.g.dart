// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BeritaDataModelAdapter extends TypeAdapter<BeritaDataModel> {
  @override
  final int typeId = 1;

  @override
  BeritaDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BeritaDataModel(
      status: fields[0] as bool,
      data: (fields[1] as List).cast<Berita>(),
      message: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BeritaDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.data)
      ..writeByte(2)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeritaDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BeritaAdapter extends TypeAdapter<Berita> {
  @override
  final int typeId = 2;

  @override
  Berita read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Berita(
      id: fields[0] as String,
      title: fields[1] as String,
      photo: fields[2] as String,
      video: fields[3] as String,
      date: fields[4] as String,
      createdAt: fields[5] as String,
      categoryName: fields[6] as String,
      like: fields[7] as String,
      bookmark: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Berita obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.video)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.categoryName)
      ..writeByte(7)
      ..write(obj.like)
      ..writeByte(8)
      ..write(obj.bookmark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BeritaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
