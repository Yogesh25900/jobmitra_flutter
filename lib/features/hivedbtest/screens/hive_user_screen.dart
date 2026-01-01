import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jobmitra_flutter/core/constants/hive_table_constant.dart';
import 'package:jobmitra_flutter/features/auth/data/models/talent_user_hive_model.dart';
import 'package:jobmitra_flutter/features/auth/data/models/recruiter_hive_model.dart';

class HiveUsersScreen extends StatefulWidget {
  const HiveUsersScreen({super.key});

  @override
  State<HiveUsersScreen> createState() => _HiveUsersScreenState();
}

class _HiveUsersScreenState extends State<HiveUsersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<TalentUserHiveModel> talentUsers = [];
  List<RecruiterHiveModel> recruiters = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    loadAllUsers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> loadAllUsers() async {
    setState(() {
      isLoading = true;
    });

    try {
      final talentBox = await Hive.openBox<TalentUserHiveModel>(
        HiveTableConstant.talentTable,
      );
      final recruiterBox = await Hive.openBox<RecruiterHiveModel>(
        HiveTableConstant.recruiterTable,
      );

      setState(() {
        talentUsers = talentBox.values.toList();
        recruiters = recruiterBox.values.toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading users: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Database Viewer'),
        backgroundColor: const Color(0xFF136DEC),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: loadAllUsers,
            tooltip: 'Refresh',
          ),
          const SizedBox(width: 8),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(
              icon: const Icon(Icons.person),
              text: 'Talent (${talentUsers.length})',
            ),
            Tab(
              icon: const Icon(Icons.business),
              text: 'Recruiters (${recruiters.length})',
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF136DEC),
              ),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                _buildTalentList(),
                _buildRecruiterList(),
              ],
            ),
    );
  }

  Widget _buildTalentList() {
    if (talentUsers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No Talent Users Yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Talent users will appear here after registration',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: talentUsers.length,
      itemBuilder: (context, index) {
        final user = talentUsers[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF136DEC),
              child: Text(
                user.fname.isNotEmpty ? user.fname[0].toUpperCase() : 'U',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              "${user.fname} ${user.lname}".trim().isEmpty
                  ? 'User ${index + 1}'
                  : "${user.fname} ${user.lname}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        user.role.toUpperCase(),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (user.isEmailVerified)
                      const Icon(
                        Icons.verified,
                        size: 16,
                        color: Colors.green,
                      ),
                  ],
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              _buildSection('Personal Information', [
                _info('Full Name', "${user.fname} ${user.lname}"),
                _info('Email', user.email),
                _info('Phone', user.phoneNumber),
                _info('Date of Birth', user.dateOfBirth),
                _info('Location', user.location),
              ]),
              const Divider(height: 24),
              _buildSection('Professional Details', [
                _info('Title', user.title),
                _info('Summary', user.summary),
                _info('Role', user.role),
                _info('Skills', user.skills.join(", ")),
              ]),
              const Divider(height: 24),
              _buildSection('Social Links', [
                _info('LinkedIn', user.linkedin),
                _info('GitHub', user.github),
                _info('Portfolio', user.portfolioLink),
              ]),
              const Divider(height: 24),
              _buildSection('System Information', [
                _info('User ID', user.id),
                _info('Email Verified', user.isEmailVerified ? 'Yes' : 'No'),
                _info('Is Employer', user.isEmployer ? 'Yes' : 'No'),
                _info('Profile Picture', user.profilePicturePath),
                _info('CV Path', user.cvPath),
                _info('Google ID', user.googleId),
                _info('Created At', _formatDate(user.createdAt)),
                _info('Database', HiveTableConstant.talentTable),
              ]),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecruiterList() {
    if (recruiters.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.business_center_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              'No Recruiters Yet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Recruiters will appear here after registration',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: recruiters.length,
      itemBuilder: (context, index) {
        final recruiter = recruiters[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ExpansionTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purple.shade700,
              child: Text(
                recruiter.companyName.isNotEmpty 
                    ? recruiter.companyName[0].toUpperCase() 
                    : 'R',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              recruiter.companyName.isEmpty
                  ? 'Recruiter ${index + 1}'
                  : recruiter.companyName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  recruiter.email,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        recruiter.role.toUpperCase(),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (recruiter.isEmailVerified)
                      const Icon(
                        Icons.verified,
                        size: 16,
                        color: Colors.green,
                      ),
                  ],
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              _buildSection('Company Information', [
                _info('Company Name', recruiter.companyName),
                _info('Contact Person', recruiter.contactName),
                _info('Contact Email', recruiter.contactEmail),
                _info('Email', recruiter.email),
                _info('Phone', recruiter.phoneNumber),
                _info('Website', recruiter.website),
                _info('Location', recruiter.location),
              ]),
              const Divider(height: 24),
              _buildSection('Business Details', [
                _info('Industry', recruiter.industry),
                _info('Company Size', recruiter.companySize),
                _info('Description', recruiter.description),
              ]),
              const Divider(height: 24),
              _buildSection('Social Links', [
                _info('LinkedIn', recruiter.linkedin),
                _info('Facebook', recruiter.facebook ),
                _info('Twitter', recruiter.twitter ),
              ]),
              const Divider(height: 24),
              _buildSection('System Information', [
                _info('User ID', recruiter.id),
                _info('Email Verified', recruiter.isEmailVerified ? 'Yes' : 'No'),
                _info('Role', recruiter.role),
                _info('Logo Path', recruiter.logoPath),
                _info('Google ID', recruiter.googleId),
                _info('Created At', _formatDate(recruiter.createdAt)),
                _info('Database', HiveTableConstant.recruiterTable),
              ]),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF136DEC),
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _info(String label, String value) {
    if (value.isEmpty || value == 'N/A') return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
