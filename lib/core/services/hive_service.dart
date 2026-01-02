import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:jobmitra_flutter/core/constants/hive_table_constant.dart';
import 'package:jobmitra_flutter/features/auth/data/models/talent_user_hive_model.dart';
import 'package:jobmitra_flutter/features/auth/data/models/recruiter_hive_model.dart';


class HiveService {
  // Initialize Hive
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/${HiveTableConstant.dbName}';
    Hive.init(path);

    _registerAdapter();
    await openBoxes();
  }

  // Register adapters
  void _registerAdapter() {
    if (!Hive.isAdapterRegistered(HiveTableConstant.talentTypeId)) {
      Hive.registerAdapter(TalentUserHiveModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveTableConstant.recruiterTypeId)) {
      Hive.registerAdapter(RecruiterHiveModelAdapter());
    }
  }

  // Open boxes
  Future<void> openBoxes() async {
    await Hive.openBox<TalentUserHiveModel>(HiveTableConstant.talentTable);
    await Hive.openBox<RecruiterHiveModel>(HiveTableConstant.recruiterTable);
  }

  // Close boxes
  Future<void> closeBox() async {
    await Hive.close();
  }

  // Box getter
  Box<TalentUserHiveModel> get _talentBox =>
      Hive.box<TalentUserHiveModel>(HiveTableConstant.talentTable);

  Box<RecruiterHiveModel> get _recruiterBox =>
      Hive.box<RecruiterHiveModel>(HiveTableConstant.recruiterTable);

  // CRUD methods for Talent Users
  Future<TalentUserHiveModel> createUser(TalentUserHiveModel user) async {
    await _talentBox.put(user.id, user);
    return user;
  }

  List<TalentUserHiveModel> getAllUsers() {
    return _talentBox.values.toList();
  }

  Future<TalentUserHiveModel?> getUserById(String id) async {
    return _talentBox.get(id);
  }

  Future<void> updateUser(TalentUserHiveModel user) async {
    await _talentBox.put(user.id, user);
  }

  Future<void> deleteUser(String id) async {
    await _talentBox.delete(id);
  }

  // CRUD methods for Recruiters
  Future<RecruiterHiveModel> createRecruiter(RecruiterHiveModel recruiter) async {
    await _recruiterBox.put(recruiter.id, recruiter);
    return recruiter;
  }

  List<RecruiterHiveModel> getAllRecruiters() {
    return _recruiterBox.values.toList();
  }

  Future<RecruiterHiveModel?> getRecruiterById(String id) async {
    return _recruiterBox.get(id);
  }

  Future<void> updateRecruiter(RecruiterHiveModel recruiter) async {
    await _recruiterBox.put(recruiter.id, recruiter);
  }

  Future<void> deleteRecruiter(String id) async {
    await _recruiterBox.delete(id);
  }
}
