import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/core/error/failures.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/talent_entity.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_login_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/repositories/talent_repository.dart';


class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<Either<Failures, TalentUserEntity>> call(TalentUserLoginParams params) {
    return repository.loginUser(params);
  }
}
