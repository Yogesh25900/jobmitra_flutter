import 'package:jobmitra_flutter/features/auth/domain/entities/talent_entity.dart';


abstract class ITalentUserDataSource {


  Future<TalentUserEntity> registerUser(TalentUserEntity user);
  Future<TalentUserEntity> loginUser(String email, String password);
  Future<TalentUserEntity?> getUserById(String id);
  Future<bool> updateUser(TalentUserEntity user);
  Future<bool> deleteUser(String id);
}
