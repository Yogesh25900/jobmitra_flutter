import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/core/error/failures.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/talent_entity.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_register_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/repositories/auth_repository.dart';


class RegisterTalentUser {
  final AuthRepository repository;

  RegisterTalentUser(this.repository);

  Future<Either<Failures, TalentUserEntity>> call(TalentUserRegisterParams params) {
    return repository.registerUser(params);
  }
}
