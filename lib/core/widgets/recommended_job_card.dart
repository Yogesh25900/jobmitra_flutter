import 'package:flutter/material.dart';

class RecommendedJobCard extends StatelessWidget {
  final String title;
  final String type;
  final String company;
  final String location;

  const RecommendedJobCard({
    super.key,
    required this.title,
    required this.type,
    required this.company,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.network(
            'https://cdn.vectorstock.com/i/500p/37/38/google-logo-icon-vector-58333738.jpg',
            height: 60,
            width: 60,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
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
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text('Apply'),
          )
        ],
      ),
    );
  }
}
