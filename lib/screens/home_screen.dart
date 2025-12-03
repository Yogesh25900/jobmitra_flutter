import 'package:flutter/material.dart';
import 'package:jobmitra_flutter/widgets/bottom_nav_bar.dart';
import 'package:jobmitra_flutter/widgets/category_item.dart';
import 'package:jobmitra_flutter/widgets/job_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                    color: Colors.grey[600],
                  ),
                  const Text(
                    'JobMitra',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined),
                        onPressed: () {},
                        color: Colors.grey[600],
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User greeting section
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Hello, Yogesh!',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Here are jobs recommended for you.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/09/12/11/naturo-monkey-selfie.jpg?quality=75&width=1250&crop=3%3A2%2Csmart&auto=webp',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Search bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search jobs, companies...',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.tune),
                              onPressed: () {},
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CategoryItem(
                              icon: Icons.computer,
                              title: 'IT',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.campaign,
                              title: 'Marketing',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.attach_money,
                              title: 'Finance',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.design_services,
                              title: 'Design',
                              color: Color(0xFF7EB6FF),
                            ),
                             CategoryItem(
                              icon: Icons.computer,
                              title: 'IT',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.campaign,
                              title: 'Marketing',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.attach_money,
                              title: 'Finance',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.design_services,
                              title: 'Design',
                              color: Color(0xFF7EB6FF),
                            ), CategoryItem(
                              icon: Icons.computer,
                              title: 'IT',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.campaign,
                              title: 'Marketing',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.attach_money,
                              title: 'Finance',
                              color: Color(0xFF7EB6FF),
                            ),
                            CategoryItem(
                              icon: Icons.design_services,
                              title: 'Design',
                              color: Color(0xFF7EB6FF),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Featured Jobs
                      const Text(
                        'Featured Jobs',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Job Cards
                      const JobCard(
                        companyLogo: 'A',
                        logoColor: Colors.blue,
                        position: 'Software Engineer',
                        company: 'Google Inc.',
                        location: 'Mountain View, CA',
                        jobType: 'Full-time',
                      ),
                      
                      const SizedBox(height: 12),
                      
                      const JobCard(
                        companyLogo: 'N',
                        logoColor: Colors.red,
                        position: 'UI/UX Designer',
                        company: 'Apple Inc.',
                        location: 'Cuperturo, Logees, CA',
                        jobType: 'Full-time',
                      ),
                      
                      const SizedBox(height: 12),
                      
                      const JobCard(
                        companyLogo: 'P',
                        logoColor: Colors.green,
                        position: 'Electrical Engineer',
                        company: 'Netflix',
                        location: 'Tesla a Lɵngeles, CA',
                        jobType: 'Full-time',
                        isPartTime: true,
                      ),
                      
                      const SizedBox(height: 12),
                      
                      const JobCard(
                        companyLogo: 'T',
                        logoColor: Colors.blue,
                        position: 'Social Media Manager',
                        company: 'Tewla Inc.',
                        location: 'San Francisco, CA',
                        jobType: 'Full-time',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Bottom Navigation Bar
            const BottomNavBar(),
          ],
        ),
      ),
    );
  }
}
