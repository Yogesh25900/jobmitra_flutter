import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tagStyle = TextStyle(color: Colors.deepPurple[200], fontWeight: FontWeight.w600);
    final chipBgColor = Colors.deepPurple[50];

    Widget categoryChip(String label, IconData? icon) {
      return Chip(
        backgroundColor: chipBgColor,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Icon(icon, size: 16, color: Colors.deepPurple),
            if (icon != null) SizedBox(width: 4),
            Text(label, style: TextStyle(color: Colors.deepPurple)),
          ],
        ),
      );
    }

    Widget jobCard(String title, String company, String location, String imageUrl) {
      return Container(
        margin: EdgeInsets.only(right: 12),
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, height: 100, width: 160, fit: BoxFit.cover),
            ),
            SizedBox(height: 6),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(company, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
      );
    }

    Widget recommendedJobItem(String title, String type, String company, String location) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn.vectorstock.com/i/500p/37/38/google-logo-icon-vector-58333738.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(
                    '$type · $company · $location',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Apply'),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      );
    }

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
                  categoryChip("Engineering", Icons.code),
                  SizedBox(width: 8),
                  categoryChip("Marketing", Icons.campaign),
                  SizedBox(width: 8),
                  categoryChip("Design", Icons.design_services),
                ],
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  jobCard(
                    "Software Engineer",
                    "TechCorp Inc. · Remote",
                    "",
                    "https://www.techmonitor.ai/wp-content/uploads/sites/29/2017/02/shutterstock_552493561.webp",
                  ),
                  jobCard(
                    "Product Manager",
                    "Innovate Solutions",
                    "",
                    "https://www.shutterstock.com/shutterstock/videos/1080279077/thumb/1.jpg?ip=x480"
                  ),
                     jobCard(
                    "Data Analyst",
                    "Innovate Solutions",
                    "",
                    "https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2025-11/251118-cloudflare-mb-1340-a3cae0.jpg"
                  ),   jobCard(
                    "Security Engineer",
                    "Innovate Solutions",
                    "",
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcOPe3Y-08-DvLAzAoZGoqREkOfiY20xgT_w&s"
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
            recommendedJobItem("Software Engineer", "Full-time · Remote", "Google Inc.", "Remote"),
            recommendedJobItem("Product Manager", "Full-time", "Google Inc.", "New York"),
            recommendedJobItem("UX Designer", "Full-time", "Google Inc.", "California"),
             recommendedJobItem("Software Engineer", "Full-time · Remote", "Google Inc.", "Remote"),
            recommendedJobItem("Product Manager", "Full-time", "Google Inc.", "New York"),
            recommendedJobItem("UX Designer", "Full-time", "Google Inc.", "California"), recommendedJobItem("Software Engineer", "Full-time · Remote", "Google Inc.", "Remote"),
            recommendedJobItem("Product Manager", "Full-time", "Google Inc.", "New York"),
            recommendedJobItem("UX Designer", "Full-time", "Google Inc.", "California"),
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