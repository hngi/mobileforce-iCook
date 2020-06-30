// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_search.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchItemAdapter extends TypeAdapter<SearchItem> {
  @override
  final typeId = 2;

  @override
  SearchItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchItem()
      ..total = fields[0] as int
      ..count = fields[1] as int
      ..after = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, SearchItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.after);
  }
}
