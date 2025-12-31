import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [fname, lname, email, password, role];
}
