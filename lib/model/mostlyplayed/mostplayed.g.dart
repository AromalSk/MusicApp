// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mostplayed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MostPlayedAdapter extends TypeAdapter<MostPlayed> {
  @override
  final int typeId = 5;

  @override
  MostPlayed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MostPlayed(
      songId: fields[0] as int,
      artist: fields[4] as String,
      songName: fields[1] as String,
      songUrl: fields[3] as String,
      duration: fields[5] as int,
      count: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MostPlayed obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.songId)
      ..writeByte(1)
      ..write(obj.songName)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.songUrl)
      ..writeByte(4)
      ..write(obj.artist)
      ..writeByte(5)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MostPlayedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
