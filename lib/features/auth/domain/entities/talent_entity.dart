import 'package:equatable/equatable.dart';

class TalentUserEntity extends Equatable {
  final String id;
  final String fname;
  final String lname;
  final String email;
  final String dateOfBirth;
  final bool isEmailVerified;
  final String password; // optional for Google users
  final String phoneNumber;
  final String role; // candidate | employer
  final bool isEmployer;
  final String profilePicturePath;
  final String cvPath;
  final String googleId;
  final String googleProfilePicture;
  final String location;
  final String title;
  final String summary;
  final List<ExperienceEntity> experiences;
  final List<EducationEntity> education;
  final List<String> skills;
  final List<CertificationEntity> certifications;
  final List<PortfolioEntity> portfolio;
  final UserLinksEntity links;
  final DateTime createdAt;

  const TalentUserEntity({
    required this.id,
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
    required this.links,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        fname,
        lname,
        email,
        dateOfBirth,
        isEmailVerified,
        password,
        phoneNumber,
        role,
        isEmployer,
        profilePicturePath,
        cvPath,
        googleId,
        googleProfilePicture,
        location,
        title,
        summary,
        experiences,
        education,
        skills,
        certifications,
        portfolio,
        links,
        createdAt,
      ];
}



class ExperienceEntity extends Equatable {
  final String title;
  final String company;
  final String period;
  final String location;
  final String description;
  final bool isCurrent;

  const ExperienceEntity({
    required this.title,
    required this.company,
    required this.period,
    required this.location,
    required this.description,
    required this.isCurrent,
  });

  @override
  List<Object?> get props => [
        title,
        company,
        period,
        location,
        description,
        isCurrent,
      ];
}



class EducationEntity {
  final String degree;
  final String institution;
  final String period;

  EducationEntity({
    required this.degree,
    required this.institution,
    required this.period,
  });
}


class UserLinksEntity {
  final String linkedin;
  final String github;
  final String portfolio;

  UserLinksEntity({
    required this.linkedin,
    required this.github,
    required this.portfolio,
  });
}


class CertificationEntity {
  final String name;
  final String issuer;

  CertificationEntity({
    required this.name,
    required this.issuer,
  });
}

class PortfolioEntity {
  final String id;
  final String title;
  final String portfolioLink;
  final String image;

  PortfolioEntity({
    required this.id,
    required this.title,
    required this.portfolioLink,
    required this.image,
  });
}
