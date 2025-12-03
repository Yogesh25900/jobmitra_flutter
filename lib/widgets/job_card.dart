import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String companyLogo;
  final Color logoColor;
  final String position;
  final String company;
  final String location;
  final String jobType;
  final bool isPartTime;

  const JobCard({
    super.key,
    required this.companyLogo,
    required this.logoColor,
    required this.position,
    required this.company,
    required this.location,
    required this.jobType,
    this.isPartTime = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          // Company Logo
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: logoColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                companyLogo,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Job Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  position,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  company,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                if (isPartTime)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Part-time',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          
          // Right side buttons
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Apply'),
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {},
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
