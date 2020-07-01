// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_dish.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDishesAdapter extends TypeAdapter<HiveDishes> {
  @override
  final typeId = 3;

  @override
  HiveDishes read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDishes()
      ..dishImages = (fields[0] as List)?.cast<String>()
      ..recipe = (fields[1] as List)?.cast<String>()
      ..ingredients = (fields[2] as List)?.cast<String>()
      ..healthBenefits = (fields[3] as List)?.cast<String>()
      ..sId = fields[4] as String
      ..name = fields[5] as String
      ..chefId = fields[6] as String
      ..createdAt = fields[7] as String
      ..updatedAt = fields[8] as String
      ..iV = fields[9] as int
      ..commentsCount = fields[10] as int
      ..likesCount = fields[11] as int
      ..isLiked = fields[12] as bool;
  }

  @override
  void write(BinaryWriter writer, HiveDishes obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.dishImages)
      ..writeByte(1)
      ..write(obj.recipe)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.healthBenefits)
      ..writeByte(4)
      ..write(obj.sId)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.chefId)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.iV)
      ..writeByte(10)
      ..write(obj.commentsCount)
      ..writeByte(11)
      ..write(obj.likesCount)
      ..writeByte(12)
      ..write(obj.isLiked);
  }
}
