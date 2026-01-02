import 'package:equatable/equatable.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/talent_entity.dart';
import 'package:uuid/uuid.dart';

class TalentUserRegisterParams extends Equatable {
  final String fname;
  final String lname;
  final String email;
  final String password;
  final String role;

  const TalentUserRegisterParams({
    required this.fname,
    required this.lname,
    required this.email,
    required this.password,
    required this.role,
  });

TalentUserEntity toEntity() {
  return TalentUserEntity(
    id: const Uuid().v4(),
    fname: fname,
    lname: lname,
    email: email,
    password: password,
    role: role,
    dateOfBirth: "",
    phoneNumber: "",
    isEmailVerified: false,
    isEmployer: role == "employer",
    profilePicturePath: "",
    cvPath: "",
    googleId: "",
    googleProfilePicture: "",
    location: "",
    title: "",
    summary: "",
    experiences: const [],
    education: const [],
    skills: const [],
    certifications: const [],
    portfolio: const [],
    links: UserLinksEntity(
      linkedin: "",
      github: "",
      portfolio: "",
    ),
    createdAt: DateTime.now(),
  );
}


  @override
  List<Object?> get props => [fname, lname, email, password, role];
}
