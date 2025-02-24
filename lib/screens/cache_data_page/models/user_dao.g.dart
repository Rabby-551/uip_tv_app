// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserListDaoModelAdapter extends TypeAdapter<UserListDaoModel> {
  @override
  final int typeId = 0;

  @override
  UserListDaoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserListDaoModel(
      id: fields[0] as int,
      name: fields[1] as String,
      username: fields[2] as String,
      email: fields[3] as String,
      address: fields[4] as AddressDao,
      phone: fields[5] as String,
      website: fields[6] as String,
      company: fields[7] as CompanyDao,
    );
  }

  @override
  void write(BinaryWriter writer, UserListDaoModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.website)
      ..writeByte(7)
      ..write(obj.company);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserListDaoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressDaoAdapter extends TypeAdapter<AddressDao> {
  @override
  final int typeId = 1;

  @override
  AddressDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressDao(
      street: fields[0] as String,
      suite: fields[1] as String,
      city: fields[2] as String,
      zipcode: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressDao obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.zipcode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyDaoAdapter extends TypeAdapter<CompanyDao> {
  @override
  final int typeId = 3;

  @override
  CompanyDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyDao(
      name: fields[0] as String,
      catchPhrase: fields[1] as String,
      bs: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyDao obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.catchPhrase)
      ..writeByte(2)
      ..write(obj.bs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
