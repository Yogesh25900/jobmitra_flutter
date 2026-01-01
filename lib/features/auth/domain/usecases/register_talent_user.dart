import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_register_params.dart';
import '../../../../core/error/failures.dart';
import '../entities/talent_entity.dart';
import '../repositories/talent_repository.dart';

class RegisterTalentUser {
  final AuthRepository repository;

  RegisterTalentUser(this.repository);

  Future<Either<Failures, TalentUserEntity>> call(
    TalentUserRegisterParams params,
  ) {
    return repository.registerUser(params);
  }
}
