// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayListModelAdapter extends TypeAdapter<PlayListModel> {
  @override
  final int typeId = 3;

  @override
  PlayListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayListModel(
      playlistName: fields[0] as String,
    )..item = (fields[1] as List).cast<int>();
  }

  @override
  void write(BinaryWriter writer, PlayListModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.playlistName)
      ..writeByte(1)
      ..write(obj.item);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
