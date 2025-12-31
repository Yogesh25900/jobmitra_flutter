import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_login_params.dart';
import '../../../../core/error/failures.dart';
import '../entities/talent_entity.dart';
import '../repositories/auth_repository.dart';

class LoginTalentUser {
  final AuthRepository repository;

  LoginTalentUser(this.repository);

  Future<Either<Failures, TalentUserEntity>> call(
    TalentUserLoginParams params,
  ) {
    return repository.loginUser(params);
  }
}
