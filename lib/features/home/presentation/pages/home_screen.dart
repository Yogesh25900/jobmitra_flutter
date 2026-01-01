import 'package:flutter/material.dart';
import 'package:jobmitra_flutter/core/widgets/category_chip.dart';
import 'package:jobmitra_flutter/core/widgets/job_card.dart';
import 'package:jobmitra_flutter/core/widgets/recommended_job_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black87),
        title: Text('JobMitra', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_none, color: Colors.black87),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: ListView(
          children: [
            SizedBox(height: 12),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Hello, ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  TextSpan(text: 'Yogesh ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  WidgetSpan(
                    child: Text('👋', style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Find your dream job today.",
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search jobs, companies...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.deepPurple[50],
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                CategoryChip(label: "Engineering", icon: Icons.code),
                  SizedBox(width: 8),

                CategoryChip(label: "Marketing", icon: Icons.campaign),
                  SizedBox(width: 8),

                CategoryChip(label: "Design", icon: Icons.design_services),
                  SizedBox(width: 8),


                 
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  JobCard(
                    title:  "Software Engineer",
                    company: "TechCorp Inc. · Remote",
                   
                    imageUrl:  "https://www.techmonitor.ai/wp-content/uploads/sites/29/2017/02/shutterstock_552493561.webp",
                  ),
                  JobCard(
                   title:  "Product Manager",
                   company:  "Innovate Solutions",
                    
                    imageUrl: "https://www.shutterstock.com/shutterstock/videos/1080279077/thumb/1.jpg?ip=x480"
                  ),
                     JobCard(
                    title: "Data Analyst",
                    company: "Innovate Solutions",
                 
                    imageUrl: "https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-11/251118-cloudflare-mb-1340-a3cae0.jpg"
                  ),   JobCard(
                    title: "Security Engineer",
                    company: "Innovate Solutions",
                    
                   imageUrl:  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcOPe3Y-08-DvLAzAoZGoqREkOfiY20xgT_w&s"
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Recommended Jobs",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 12),
            RecommendedJobCard(
              title: "Software Engineer",
               type: "Full-time · Remote",
               company:  "Google Inc.", 
               location: "Remote"),
            RecommendedJobCard(
              title: "Product Manager", 
              type: "Full-time", 
              company: "Google Inc.", 
              location: "New York"),
            RecommendedJobCard(
              title: "UX Designer", 
              type: "Full-time", 
              company: "Google Inc.", 
              location: "California"),
             RecommendedJobCard(
              title: "Software Engineer", 
              type: "Full-time · Remote", 
              company: "Google Inc.",
              location:  "Remote"),

            RecommendedJobCard(
              title: "Product Manager", 
              type: "Full-time", 
              company: "Google Inc.",
              location:  "New York"),
            RecommendedJobCard(
              title: "UX Designer", 
              type: "Full-time", 
              company: "Google Inc.",
              location:  "California"), 
              RecommendedJobCard(
                title: "Software Engineer",
                type:  "Full-time · Remote", 
                company: "Google Inc.",
                location:  "Remote"),
            RecommendedJobCard(
              title: "Product Manager", 
              type: "Full-time", 
              company: "Google Inc.", 
              location: "New York"),
            RecommendedJobCard(
              title: "UX Designer", 
              type: "Full-time", 
              company: "Google Inc.", 
              location: "California"),
            SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: "Applied"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}