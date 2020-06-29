// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_h.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalUserAdapter extends TypeAdapter<LocalUser> {
  @override
  final typeId = 0;

  @override
  LocalUser read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUser(
      name: fields[0] as String,
      email: fields[1] as String,
      token: fields[2] as String,
      userID: fields[3] as String,
      profileID: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.userID)
      ..writeByte(4)
      ..write(obj.profileID);
  }
}
