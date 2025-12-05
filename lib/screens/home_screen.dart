import 'package:flutter/material.dart';
import 'package:jobmitra_flutter/widgets/bottom_nav_bar.dart';
import 'package:jobmitra_flutter/widgets/job_card.dart';
import 'package:jobmitra_flutter/widgets/job_category.dart';
import 'package:jobmitra_flutter/widgets/recommended_job_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'JobMitra',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Hello, Yogesh',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Find your dream job today.',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black87),
            ),
            const SizedBox(height: 24),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey.shade600),
                  hintText: 'Search jobs, companies...',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Job Categories
         SizedBox(
  height: 50, // adjust height for JobCategory
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: const [
        JobCategory(icon: Icons.code, title: 'Engineering'),
        SizedBox(width: 16),
        JobCategory(icon: Icons.campaign, title: 'Marketing'),
        SizedBox(width: 16),
        JobCategory(icon: Icons.design_services, title: 'Design'),
        SizedBox(width: 16),
        JobCategory(icon: Icons.code, title: 'Engineering'),
        SizedBox(width: 16),
        JobCategory(icon: Icons.campaign, title: 'Marketing'),
        SizedBox(width: 16),
        JobCategory(icon: Icons.design_services, title: 'Design'),
        SizedBox(width: 16),
        JobCategory(icon: Icons.code, title: 'Engineering'),
        SizedBox(width: 16),
        JobCategory(icon: Icons.campaign, title: 'Marketing'),
        SizedBox(width: 16),
        JobCategory(icon: Icons.design_services, title: 'Design'),
      ],
    ),
  ),
),

            const SizedBox(height: 15),

            // Horizontal Job Cards
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  JobCard(
                    title: 'Software Engineer',
                    company: 'Google Inc. - Remote',
                    imageUrl: 'assets/images/google_campus.png',
                  ),
                  SizedBox(width: 16),
                  JobCard(
                    title: 'Product Manager',
                    company: 'Innovate Solutions',
                    imageUrl: 'assets/images/google_campus.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Recommended Jobs
            Text(
              'Recommended Jobs',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 16),
            const RecommendedJobCard(
              company: 'Google Inc',
              location: 'Remote',
              title: 'Software Engineer',
              type: 'Full-time',
            ),
            const SizedBox(height: 16),
            const RecommendedJobCard(
              company: 'Google Inc',
              location: 'New York',
              title: 'Product Manager',
              type: 'Full-time',
            ),
            const SizedBox(height: 16),
            const RecommendedJobCard(
              company: 'Google Inc',
              location: 'California',
              title: 'UX Designer',
              type: 'Full-time',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
