import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_register_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/recruiter_login_params.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/recruiter_entity.dart';
import '../../domain/repositories/recruiter_repository.dart';
import '../datasources/local/recruiter_local_datasource.dart';

class RecruiterRepositoryImpl implements RecruiterRepository {
  final RecruiterLocalDataSourceImpl localDataSource;

  RecruiterRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failures, RecruiterEntity>> registerRecruiter(
    RecruiterRegisterParams params,
  ) async {
    try {
      final entity = params.toEntity();
      final result = await localDataSource.registerRecruiter(entity);
      return Right(result);
    } catch (e) {
      return const Left(
        LocalDatabaseFailure(),
      );
    }
  }

  @override
  Future<Either<Failures, RecruiterEntity>> loginRecruiter(
    RecruiterLoginParams params,
  ) async {
    try {
      final result = await localDataSource.loginRecruiter(params.email, params.password);
      return Right(result);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(message: e.toString()),
      );
    }
  }
}
