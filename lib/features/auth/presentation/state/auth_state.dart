import '../../domain/entities/talent_entity.dart';
import '../../domain/entities/recruiter_entity.dart';

enum AuthStatus { initial, loading, success, error }

class AuthState {
  final AuthStatus status;
  final AuthStatus signupStatus; // Separate status for signup
  final AuthStatus loginStatus;  // Separate status for login
  final TalentUserEntity? talentUser;
  final RecruiterEntity? recruiterUser;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.signupStatus = AuthStatus.initial,
    this.loginStatus = AuthStatus.initial,
    this.talentUser,
    this.recruiterUser,
    this.errorMessage,
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthStatus? signupStatus,
    AuthStatus? loginStatus,
    TalentUserEntity? talentUser,
    RecruiterEntity? recruiterUser,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      signupStatus: signupStatus ?? this.signupStatus,
      loginStatus: loginStatus ?? this.loginStatus,
      talentUser: talentUser ?? this.talentUser,
      recruiterUser: recruiterUser ?? this.recruiterUser,
      errorMessage: errorMessage,
    );
  }
}
