// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talent_user_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TalentUserHiveModelAdapter extends TypeAdapter<TalentUserHiveModel> {
  @override
  final int typeId = 0;

  @override
  TalentUserHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TalentUserHiveModel(
      id: fields[0] as String?,
      fname: fields[1] as String,
      lname: fields[2] as String,
      email: fields[3] as String,
      dateOfBirth: fields[4] as String,
      isEmailVerified: fields[5] as bool,
      password: fields[6] as String,
      phoneNumber: fields[7] as String,
      role: fields[8] as String,
      isEmployer: fields[9] as bool,
      profilePicturePath: fields[10] as String,
      cvPath: fields[11] as String,
      googleId: fields[12] as String,
      googleProfilePicture: fields[13] as String,
      location: fields[14] as String,
      title: fields[15] as String,
      summary: fields[16] as String,
      experiences: (fields[17] as List).cast<dynamic>(),
      education: (fields[18] as List).cast<dynamic>(),
      skills: (fields[19] as List).cast<String>(),
      certifications: (fields[20] as List).cast<dynamic>(),
      portfolio: (fields[21] as List).cast<dynamic>(),
      linkedin: fields[22] as String,
      github: fields[23] as String,
      portfolioLink: fields[24] as String,
      createdAt: fields[25] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TalentUserHiveModel obj) {
    writer
      ..writeByte(26)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fname)
      ..writeByte(2)
      ..write(obj.lname)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.dateOfBirth)
      ..writeByte(5)
      ..write(obj.isEmailVerified)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.role)
      ..writeByte(9)
      ..write(obj.isEmployer)
      ..writeByte(10)
      ..write(obj.profilePicturePath)
      ..writeByte(11)
      ..write(obj.cvPath)
      ..writeByte(12)
      ..write(obj.googleId)
      ..writeByte(13)
      ..write(obj.googleProfilePicture)
      ..writeByte(14)
      ..write(obj.location)
      ..writeByte(15)
      ..write(obj.title)
      ..writeByte(16)
      ..write(obj.summary)
      ..writeByte(17)
      ..write(obj.experiences)
      ..writeByte(18)
      ..write(obj.education)
      ..writeByte(19)
      ..write(obj.skills)
      ..writeByte(20)
      ..write(obj.certifications)
      ..writeByte(21)
      ..write(obj.portfolio)
      ..writeByte(22)
      ..write(obj.linkedin)
      ..writeByte(23)
      ..write(obj.github)
      ..writeByte(24)
      ..write(obj.portfolioLink)
      ..writeByte(25)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TalentUserHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
