import 'package:hive/hive.dart';
import 'package:jobmitra_flutter/core/constants/hive_table_constant.dart';
import '../../domain/entities/recruiter_entity.dart';

part 'recruiter_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.recruiterTypeId, adapterName: 'RecruiterHiveModelAdapter')
class RecruiterHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String companyName;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final String phoneNumber;

  @HiveField(5)
  final String website;

  @HiveField(6)
  final String industry;

  @HiveField(7)
  final String location;

  @HiveField(8)
  final String companySize;

  @HiveField(9)
  final String description;

  @HiveField(10)
  final String contactName;

  @HiveField(11)
  final String contactEmail;

  @HiveField(12)
  final String logoPath;

  @HiveField(13)
  final String role;

  @HiveField(14)
  final String linkedin;

  @HiveField(15)
  final String facebook;

  @HiveField(16)
  final String twitter;

  @HiveField(17)
  final bool isEmailVerified;

  @HiveField(18)
  final String googleId;

  @HiveField(19)
  final String googleProfilePicture;

  @HiveField(20)
  final DateTime createdAt;

  RecruiterHiveModel({
    required this.id,
    required this.companyName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.website,
    required this.industry,
    required this.location,
    required this.companySize,
    required this.description,
    required this.contactName,
    required this.contactEmail,
    required this.logoPath,
    required this.role,
    required this.linkedin,
    required this.facebook,
    required this.twitter,
    required this.isEmailVerified,
    required this.googleId,
    required this.googleProfilePicture,
    required this.createdAt,
  });

  // Convert Entity to Hive Model
  factory RecruiterHiveModel.fromEntity(RecruiterEntity entity) {
    return RecruiterHiveModel(
      id: entity.id,
      companyName: entity.companyName,
      email: entity.email,
      password: entity.password,
      phoneNumber: entity.phoneNumber,
      website: entity.website,
      industry: entity.industry,
      location: entity.location,
      companySize: entity.companySize,
      description: entity.description,
      contactName: entity.contactName,
      contactEmail: entity.contactEmail,
      logoPath: entity.logoPath,
      role: entity.role,
      linkedin: entity.socialLinks.linkedin,
      facebook: entity.socialLinks.facebook,
      twitter: entity.socialLinks.twitter,
      isEmailVerified: entity.isEmailVerified,
      googleId: entity.googleId,
      googleProfilePicture: entity.googleProfilePicture,
      createdAt: entity.createdAt,
    );
  }

  // Convert Hive Model to Entity
  RecruiterEntity toEntity() {
    return RecruiterEntity(
      id: id,
      companyName: companyName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      website: website,
      industry: industry,
      location: location,
      companySize: companySize,
      description: description,
      contactName: contactName,
      contactEmail: contactEmail,
      logoPath: logoPath,
      role: role,
      socialLinks: SocialLinksEntity(
        linkedin: linkedin,
        facebook: facebook,
        twitter: twitter,
      ),
      isEmailVerified: isEmailVerified,
      googleId: googleId,
      googleProfilePicture: googleProfilePicture,
      createdAt: createdAt,
    );
  }
}
