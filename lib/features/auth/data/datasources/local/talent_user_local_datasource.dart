import 'package:hive/hive.dart';
import '../../models/talent_user_hive_model.dart';
import '../i_talent_user_datasource.dart';
import '../../../domain/entities/talent_entity.dart';

class TalentUserLocalDataSourceImpl implements ITalentUserDataSource {
  final Box<TalentUserHiveModel> userBox;

  TalentUserLocalDataSourceImpl(this.userBox);

  @override
  Future<TalentUserEntity> registerUser(TalentUserEntity user) async {
    final model = TalentUserHiveModel.fromEntity(user);
    await userBox.put(model.id, model);
    return model.toEntity();
  }

  @override
  Future<TalentUserEntity> loginUser(String email, String password) async {
    // First check if user exists with the given email
    final userWithEmail = userBox.values.where((user) => user.email == email).toList();
    
    if (userWithEmail.isEmpty) {
      throw Exception("No account found with this email");
    }
    
    // Then check password
    final model = userWithEmail.firstWhere(
      (user) => user.password == password,
      orElse: () => throw Exception("Invalid password"),
    );
    
    return model.toEntity();
  }

  @override
  Future<TalentUserEntity?> getUserById(String id) async {
    final model = userBox.get(id);
    return model?.toEntity();
  }

  @override
  Future<bool> updateUser(TalentUserEntity user) async {
    if (!userBox.containsKey(user.id)) return false;
    final model = TalentUserHiveModel.fromEntity(user);
    await userBox.put(user.id, model);
    return true;
  }

  @override
  Future<bool> deleteUser(String id) async {
    if (!userBox.containsKey(id)) return false;
    await userBox.delete(id);
    return true;
  }
}
