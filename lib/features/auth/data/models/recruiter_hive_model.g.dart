// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruiter_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecruiterHiveModelAdapter extends TypeAdapter<RecruiterHiveModel> {
  @override
  final int typeId = 1;

  @override
  RecruiterHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecruiterHiveModel(
      id: fields[0] as String,
      companyName: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String,
      phoneNumber: fields[4] as String,
      website: fields[5] as String,
      industry: fields[6] as String,
      location: fields[7] as String,
      companySize: fields[8] as String,
      description: fields[9] as String,
      contactName: fields[10] as String,
      contactEmail: fields[11] as String,
      logoPath: fields[12] as String,
      role: fields[13] as String,
      linkedin: fields[14] as String,
      facebook: fields[15] as String,
      twitter: fields[16] as String,
      isEmailVerified: fields[17] as bool,
      googleId: fields[18] as String,
      googleProfilePicture: fields[19] as String,
      createdAt: fields[20] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, RecruiterHiveModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.companyName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.website)
      ..writeByte(6)
      ..write(obj.industry)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.companySize)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.contactName)
      ..writeByte(11)
      ..write(obj.contactEmail)
      ..writeByte(12)
      ..write(obj.logoPath)
      ..writeByte(13)
      ..write(obj.role)
      ..writeByte(14)
      ..write(obj.linkedin)
      ..writeByte(15)
      ..write(obj.facebook)
      ..writeByte(16)
      ..write(obj.twitter)
      ..writeByte(17)
      ..write(obj.isEmailVerified)
      ..writeByte(18)
      ..write(obj.googleId)
      ..writeByte(19)
      ..write(obj.googleProfilePicture)
      ..writeByte(20)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecruiterHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
