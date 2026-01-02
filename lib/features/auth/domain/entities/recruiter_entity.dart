import 'package:equatable/equatable.dart';

class RecruiterEntity extends Equatable {
  final String id;
  final String companyName;
  final String email;
  final String password;
  final String phoneNumber;
  final String website;
  final String industry;
  final String location;
  final String companySize;
  final String description;
  final String contactName;
  final String contactEmail;
  final String logoPath;
  final String role;
  final SocialLinksEntity socialLinks;
  final bool isEmailVerified;
  final String googleId;
  final String googleProfilePicture;
  final DateTime createdAt;

  const RecruiterEntity({
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
    required this.socialLinks,
    required this.isEmailVerified,
    required this.googleId,
    required this.googleProfilePicture,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        companyName,
        email,
        password,
        phoneNumber,
        website,
        industry,
        location,
        companySize,
        description,
        contactName,
        contactEmail,
        logoPath,
        role,
        socialLinks,
        isEmailVerified,
        googleId,
        googleProfilePicture,
        createdAt,
      ];
}

class SocialLinksEntity extends Equatable {
  final String linkedin;
  final String facebook;
  final String twitter;

  const SocialLinksEntity({
    required this.linkedin,
    required this.facebook,
    required this.twitter,
  });

  @override
  List<Object?> get props => [linkedin, facebook, twitter];
}
