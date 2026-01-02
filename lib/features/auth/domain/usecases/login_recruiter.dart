import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_login_params.dart';
import '../../../../core/error/failures.dart';
import '../entities/recruiter_entity.dart';
import '../repositories/recruiter_repository.dart';

class LoginRecruiter {
  final RecruiterRepository repository;

  LoginRecruiter(this.repository);

  Future<Either<Failures, RecruiterEntity>> call(
    RecruiterLoginParams params,
  ) {
    return repository.loginRecruiter(params);
  }
}
