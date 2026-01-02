import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/recruiter_entity.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_register_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_login_params.dart';
import '../../../../core/error/failures.dart';

abstract class RecruiterRepository {
  Future<Either<Failures, RecruiterEntity>> registerRecruiter(RecruiterRegisterParams params);
  Future<Either<Failures, RecruiterEntity>> loginRecruiter(RecruiterLoginParams params);
}
