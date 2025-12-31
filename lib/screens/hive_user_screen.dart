import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jobmitra_flutter/core/constants/hive_table_constant.dart';
import 'package:jobmitra_flutter/features/auth/data/models/talent_user_hive_model.dart';

class HiveUsersScreen extends StatefulWidget {
  const HiveUsersScreen({super.key});

  @override
  State<HiveUsersScreen> createState() => _HiveUsersScreenState();
}

class _HiveUsersScreenState extends State<HiveUsersScreen> {
  List<TalentUserHiveModel> users = [];

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    final box = await Hive.openBox<TalentUserHiveModel>(HiveTableConstant.talentTable);
    setState(() {
      users = box.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registered Users')),
      body: users.isEmpty
          ? const Center(child: Text("No registered users yet"))
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text("${user.fname} ${user.lname}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email: ${user.email}"),
                        Text("Phone: ${user.phoneNumber}"),
                        Text("Role: ${user.role}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
