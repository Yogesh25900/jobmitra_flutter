import 'package:equatable/equatable.dart';

class TalentUserLoginParams extends Equatable {
  final String email;
  final String password;

  const TalentUserLoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
