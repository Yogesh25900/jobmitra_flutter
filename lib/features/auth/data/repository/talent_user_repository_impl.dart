import 'package:dartz/dartz.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_register_params.dart';
import 'package:jobmitra_flutter/features/auth/domain/entities/usecases/params/talent_user_login_params.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/talent_entity.dart';
import '../../domain/repositories/talent_repository.dart';
import '../datasources/local/talent_user_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final TalentUserLocalDataSourceImpl localDataSource;

  AuthRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failures, TalentUserEntity>> registerUser(
    TalentUserRegisterParams params,
  ) async {
    try {
      final entity = params.toEntity();
      final result = await localDataSource.registerUser(entity);
      return Right(result);
    } catch (e) {
      return const Left(
        LocalDatabaseFailure(),
      );
    }
  }

  @override
  Future<Either<Failures, TalentUserEntity>> loginUser(
    TalentUserLoginParams params,
  ) async {
    try {
      final result = await localDataSource.loginUser(params.email, params.password);
      return Right(result);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(message: e.toString()),
      );
    }
  }
}
