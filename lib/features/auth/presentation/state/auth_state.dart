import '../../domain/entities/talent_entity.dart';
import '../../domain/entities/recruiter_entity.dart';

enum AuthStatus { initial, loading, success, error }

class AuthState {
  final AuthStatus status;
  final TalentUserEntity? talentUser;
  final RecruiterEntity? recruiterUser;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.talentUser,
    this.recruiterUser,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    TalentUserEntity? talentUser,
    RecruiterEntity? recruiterUser,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      talentUser: talentUser ?? this.talentUser,
      recruiterUser: recruiterUser ?? this.recruiterUser,
      errorMessage: errorMessage,
    );
  }
}
