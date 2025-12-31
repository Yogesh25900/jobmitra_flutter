import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/talent_entity.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_register_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_login_params.dart';
import 'package:jobmitra_flutter/features/auth/presentation/providers/auth_providers.dart';
import '../../domain/usecases/register_talent_user.dart';
import '../../domain/usecases/login_talent_user.dart';
import '../state/auth_state.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class AuthViewModel extends Notifier<AuthState> {
  late final RegisterTalentUser _registerTalentUser;
  late final LoginTalentUser _loginTalentUser;

  @override
  AuthState build() {
    _registerTalentUser = ref.read(registerTalentUserProvider);
    _loginTalentUser = ref.read(loginTalentUserProvider);
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
          user: user,
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
          user: user,
        );
      },
    );
  }
}
