import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/talent_entity.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_register_params.dart';
import '../../../../core/error/failures.dart';


abstract class AuthRepository {
  /// Registers a new user (Talent or Employer)
  Future<Either<Failures, TalentUserEntity>> registerUser(TalentUserRegisterParams params);

  /// Logs in an existing user
  // Future<Either<Failures, TalentUserEntity>> loginUser(LoginUserParams params);
}
