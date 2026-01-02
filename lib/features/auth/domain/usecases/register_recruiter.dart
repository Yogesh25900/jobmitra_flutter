import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_register_params.dart';
import '../../../../core/error/failures.dart';
import '../entities/recruiter_entity.dart';
import '../repositories/recruiter_repository.dart';

class RegisterRecruiter {
  final RecruiterRepository repository;

  RegisterRecruiter(this.repository);

  Future<Either<Failures, RecruiterEntity>> call(
    RecruiterRegisterParams params,
  ) {
    return repository.registerRecruiter(params);
  }
}
