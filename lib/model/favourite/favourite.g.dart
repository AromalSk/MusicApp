// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteSongsAdapter extends TypeAdapter<FavoriteSongs> {
  @override
  final int typeId = 1;

  @override
  FavoriteSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteSongs(
      id: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteSongs obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
