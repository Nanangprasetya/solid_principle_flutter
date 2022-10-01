// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAddressModelAdapter extends TypeAdapter<UserAddressModel> {
  @override
  final int typeId = 3;

  @override
  UserAddressModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAddressModel(
      street: fields[0] as String,
      suite: fields[1] as String,
      city: fields[2] as String,
      zipcode: fields[3] as String,
      lat: fields[4] as String,
      lng: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserAddressModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.zipcode)
      ..writeByte(4)
      ..write(obj.lat)
      ..writeByte(5)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAddressModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
