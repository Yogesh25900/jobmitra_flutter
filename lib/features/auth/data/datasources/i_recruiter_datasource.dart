import 'package:jobmitra_flutter/features/auth/domain/entities/recruiter_entity.dart';

abstract class IRecruiterDataSource {
  Future<RecruiterEntity> registerRecruiter(RecruiterEntity recruiter);
  Future<RecruiterEntity> loginRecruiter(String email, String password);
  Future<RecruiterEntity?> getRecruiterById(String id);
  Future<bool> updateRecruiter(RecruiterEntity recruiter);
  Future<bool> deleteRecruiter(String id);
}
