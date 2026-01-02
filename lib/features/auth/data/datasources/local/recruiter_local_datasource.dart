import 'package:hive/hive.dart';
import '../../models/recruiter_hive_model.dart';
import '../i_recruiter_datasource.dart';
import '../../../domain/entities/recruiter_entity.dart';

class RecruiterLocalDataSourceImpl implements IRecruiterDataSource {
  final Box<RecruiterHiveModel> recruiterBox;

  RecruiterLocalDataSourceImpl(this.recruiterBox);

  @override
  Future<RecruiterEntity> registerRecruiter(RecruiterEntity recruiter) async {
    final model = RecruiterHiveModel.fromEntity(recruiter);
    await recruiterBox.put(model.id, model);
    return model.toEntity();
  }

  @override
  Future<RecruiterEntity> loginRecruiter(String email, String password) async {
    // First check if recruiter exists with the given email
    final recruiterWithEmail = recruiterBox.values.where((recruiter) => recruiter.email == email).toList();
    
    if (recruiterWithEmail.isEmpty) {
      throw Exception("No account found with this email");
    }
    
    // Then check password
    final model = recruiterWithEmail.firstWhere(
      (recruiter) => recruiter.password == password,
      orElse: () => throw Exception("Invalid password"),
    );
    
    return model.toEntity();
  }

  @override
  Future<RecruiterEntity?> getRecruiterById(String id) async {
    final model = recruiterBox.get(id);
    return model?.toEntity();
  }

  @override
  Future<bool> updateRecruiter(RecruiterEntity recruiter) async {
    final model = RecruiterHiveModel.fromEntity(recruiter);
    await recruiterBox.put(model.id, model);
    return true;
  }

  @override
  Future<bool> deleteRecruiter(String id) async {
    await recruiterBox.delete(id);
    return true;
  }
}
