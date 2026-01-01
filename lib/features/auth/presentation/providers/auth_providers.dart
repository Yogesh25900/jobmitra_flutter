import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:jobmitra_flutter/core/constants/hive_table_constant.dart';
import 'package:jobmitra_flutter/features/auth/data/models/talent_user_hive_model.dart';
import 'package:jobmitra_flutter/features/auth/data/models/recruiter_hive_model.dart';
import 'package:jobmitra_flutter/features/auth/data/repository/talent_user_repository_impl.dart';
import 'package:jobmitra_flutter/features/auth/data/repository/recruiter_user_repository_impl.dart';
import 'package:jobmitra_flutter/features/auth/presentation/view_model/auth_viewmodel.dart';
import '../state/auth_state.dart';
import '../../domain/usecases/register_talent_user.dart';
import '../../domain/usecases/login_talent_user.dart';
import '../../domain/usecases/register_recruiter.dart';
import '../../domain/usecases/login_recruiter.dart';
import '../../data/datasources/local/talent_user_local_datasource.dart';
import '../../data/datasources/local/recruiter_local_datasource.dart';

// Talent User Providers
final talentUserBoxProvider =
    Provider<Box<TalentUserHiveModel>>((ref) {
return Hive.box<TalentUserHiveModel>(HiveTableConstant.talentTable);});

final talentUserLocalDatasourceProvider =
    Provider<TalentUserLocalDataSourceImpl>((ref) {
  final box = ref.read(talentUserBoxProvider);
  return TalentUserLocalDataSourceImpl(box);
});

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final local = ref.read(talentUserLocalDatasourceProvider);
  return AuthRepositoryImpl(localDataSource: local);
});

final registerTalentUserProvider = Provider<RegisterTalentUser>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return RegisterTalentUser(repo);
});

final loginTalentUserProvider = Provider<LoginTalentUser>((ref) {
  final repo = ref.read(authRepositoryProvider);
  return LoginTalentUser(repo);
});

// Recruiter Providers
final recruiterBoxProvider =
    Provider<Box<RecruiterHiveModel>>((ref) {
return Hive.box<RecruiterHiveModel>(HiveTableConstant.recruiterTable);});

final recruiterLocalDatasourceProvider =
    Provider<RecruiterLocalDataSourceImpl>((ref) {
  final box = ref.read(recruiterBoxProvider);
  return RecruiterLocalDataSourceImpl(box);
});

final recruiterRepositoryProvider = Provider<RecruiterRepositoryImpl>((ref) {
  final local = ref.read(recruiterLocalDatasourceProvider);
  return RecruiterRepositoryImpl(localDataSource: local);
});

final registerRecruiterProvider = Provider<RegisterRecruiter>((ref) {
  final repo = ref.read(recruiterRepositoryProvider);
  return RegisterRecruiter(repo);
});

final loginRecruiterProvider = Provider<LoginRecruiter>((ref) {
  final repo = ref.read(recruiterRepositoryProvider);
  return LoginRecruiter(repo);
});

// Auth ViewModel
final authViewModelProvider =
    NotifierProvider<AuthViewModel, AuthState>(
  AuthViewModel.new,
);
