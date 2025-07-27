// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchlistModelAdapter extends TypeAdapter<WatchlistModel> {
  @override
  final int typeId = 0;

  @override
  WatchlistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchlistModel(
      title: fields[0] as String,
      overView: fields[1] as String,
      year: fields[2] as String,
      rate: fields[3] as double,
      image: fields[4] as String,
      id: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WatchlistModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.overView)
      ..writeByte(2)
      ..write(obj.year)
      ..writeByte(3)
      ..write(obj.rate)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchlistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
