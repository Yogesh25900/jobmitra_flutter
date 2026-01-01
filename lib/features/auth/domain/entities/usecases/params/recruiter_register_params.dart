import 'package:equatable/equatable.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/recruiter_entity.dart';
import 'package:uuid/uuid.dart';

class RecruiterRegisterParams extends Equatable {
  final String companyName;
  final String contactName;
  final String email;
  final String password;

  const RecruiterRegisterParams({
    required this.companyName,
    required this.contactName,
    required this.email,
    required this.password,
  });

  RecruiterEntity toEntity() {
    return RecruiterEntity(
      id: const Uuid().v4(),
      companyName: companyName,
      email: email,
      password: password,
      phoneNumber: "",
      website: "",
      industry: "",
      location: "",
      companySize: "",
      description: "",
      contactName: contactName,
      contactEmail: email,
      logoPath: "",
      role: "employer",
      socialLinks: const SocialLinksEntity(
        linkedin: "",
        facebook: "",
        twitter: "",
      ),
      isEmailVerified: false,
      googleId: "",
      googleProfilePicture: "",
      createdAt: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [companyName, contactName, email, password];
}
