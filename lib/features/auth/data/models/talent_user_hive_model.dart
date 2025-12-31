import 'package:hive/hive.dart';
import 'package:jobmitra_flutter/core/constants/hive_table_constant.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/talent_entity.dart';
import 'package:uuid/uuid.dart';
  //adapter : binary lai object ma convert grne as local data is stored in binart form

part 'talent_user_hive_model.g.dart';
//dart run build_runner build -d

@HiveType(typeId: HiveTableConstant.talentTypeId)
class TalentUserHiveModel extends HiveObject {
  @HiveField(0) String id;
  @HiveField(1) String fname;
  @HiveField(2) String lname;
  @HiveField(3) String email;
  @HiveField(4) String dateOfBirth;
  @HiveField(5) bool isEmailVerified;
  @HiveField(6) String password;
  @HiveField(7) String phoneNumber;
  @HiveField(8) String role;
  @HiveField(9) bool isEmployer;
  @HiveField(10) String profilePicturePath;
  @HiveField(11) String cvPath;
  @HiveField(12) String googleId;
  @HiveField(13) String googleProfilePicture;
  @HiveField(14) String location;
  @HiveField(15) String title;
  @HiveField(16) String summary;
  @HiveField(17) List experiences;
  @HiveField(18) List education;
  @HiveField(19) List<String> skills;
  @HiveField(20) List certifications;
  @HiveField(21) List portfolio;
  @HiveField(22) String linkedin;
  @HiveField(23) String github;
  @HiveField(24) String portfolioLink;
  @HiveField(25) DateTime createdAt;

  TalentUserHiveModel({
    String? id,
    required this.fname,
    required this.lname,
    required this.email,
    required this.dateOfBirth,
    required this.isEmailVerified,
    required this.password,
    required this.phoneNumber,
    required this.role,
    required this.isEmployer,
    required this.profilePicturePath,
    required this.cvPath,
    required this.googleId,
    required this.googleProfilePicture,
    required this.location,
    required this.title,
    required this.summary,
    required this.experiences,
    required this.education,
    required this.skills,
    required this.certifications,
    required this.portfolio,
    required this.linkedin,
    required this.github,
    required this.portfolioLink,
    required this.createdAt,
  }):   id = id ?? const Uuid().v4();


  // Convert Hive model to Domain Entity
  TalentUserEntity toEntity() {
    return TalentUserEntity(
      id: id,
      fname: fname,
      lname: lname,
      email: email,
      dateOfBirth: dateOfBirth,
      isEmailVerified: isEmailVerified,
      password: password,
      phoneNumber: phoneNumber,
      role: role,
      isEmployer: isEmployer,
      profilePicturePath: profilePicturePath,
      cvPath: cvPath,
      googleId: googleId,
      googleProfilePicture: googleProfilePicture,
      location: location,
      title: title,
      summary: summary,
      experiences: experiences.cast(),
      education: education.cast(),
      skills: skills,
      certifications: certifications.cast(),
      portfolio: portfolio.cast(),
      links: UserLinksEntity(
        linkedin: linkedin,
        github: github,
        portfolio: portfolioLink,
      ),
      createdAt: createdAt,
    );
  }

  // Convert Domain Entity to Hive Model
  static TalentUserHiveModel fromEntity(TalentUserEntity entity) {
    return TalentUserHiveModel(
      id: entity.id,
      fname: entity.fname,
      lname: entity.lname,
      email: entity.email,
      dateOfBirth: entity.dateOfBirth,
      isEmailVerified: entity.isEmailVerified,
      password: entity.password,
      phoneNumber: entity.phoneNumber,
      role: entity.role,
      isEmployer: entity.isEmployer,
      profilePicturePath: entity.profilePicturePath,
      cvPath: entity.cvPath,
      googleId: entity.googleId,
      googleProfilePicture: entity.googleProfilePicture,
      location: entity.location,
      title: entity.title,
      summary: entity.summary,
      experiences: entity.experiences,
      education: entity.education,
      skills: entity.skills,
      certifications: entity.certifications,
      portfolio: entity.portfolio,
      linkedin: entity.links.linkedin,
      github: entity.links.github,
      portfolioLink: entity.links.portfolio,
      createdAt: entity.createdAt,
    );
  }
}
