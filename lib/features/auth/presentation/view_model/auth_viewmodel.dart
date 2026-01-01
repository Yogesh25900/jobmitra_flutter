import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/talent_entity.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/recruiter_entity.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_register_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_login_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_register_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_login_params.dart';
import 'package:jobmitra_flutter/features/auth/presentation/providers/auth_providers.dart';
import '../../domain/usecases/register_talent_user.dart';
import '../../domain/usecases/login_talent_user.dart';
import '../../domain/usecases/register_recruiter.dart';
import '../../domain/usecases/login_recruiter.dart';
import '../state/auth_state.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class AuthViewModel extends Notifier<AuthState> {
  late final RegisterTalentUser _registerTalentUser;
  late final LoginTalentUser _loginTalentUser;
  late final RegisterRecruiter _registerRecruiter;
  late final LoginRecruiter _loginRecruiter;

  @override
  AuthState build() {
    _registerTalentUser = ref.read(registerTalentUserProvider);
    _loginTalentUser = ref.read(loginTalentUserProvider);
    _registerRecruiter = ref.read(registerRecruiterProvider);
    _loginRecruiter = ref.read(loginRecruiterProvider);
    return const AuthState();
  }

  Future<void> registerTalentUser(TalentUserRegisterParams params) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    final Either<Failures, TalentUserEntity> result =
        await _registerTalentUser(params);

    result.fold(
      (failure) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: failure.message,
        );
      },
      (user) {
        state = state.copyWith(
          status: AuthStatus.success,
          talentUser: user,
        );
      },
    );
  }

  Future<void> loginTalentUser(TalentUserLoginParams params) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    final Either<Failures, TalentUserEntity> result =
        await _loginTalentUser(params);

    result.fold(
      (failure) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: failure.message,
        );
      },
      (user) {
        state = state.copyWith(
          status: AuthStatus.success,
          talentUser: user,
        );
      },
    );
  }

  Future<void> registerRecruiter(RecruiterRegisterParams params) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    final Either<Failures, RecruiterEntity> result =
        await _registerRecruiter(params);

    result.fold(
      (failure) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: failure.message,
        );
      },
      (user) {
        state = state.copyWith(
          status: AuthStatus.success,
          recruiterUser: user,
        );
      },
    );
  }

  Future<void> loginRecruiter(RecruiterLoginParams params) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    final Either<Failures, RecruiterEntity> result =
        await _loginRecruiter(params);

    result.fold(
      (failure) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: failure.message,
        );
      },
      (user) {
        state = state.copyWith(
          status: AuthStatus.success,
          recruiterUser: user,
        );
      },
    );
  }
}
