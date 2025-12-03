import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', true, Colors.blue),
          _buildNavItem(Icons.search, 'Jobs', false, Colors.blue),
          _buildNavItem(Icons.folder, 'Applied', false, Colors.grey),
          _buildNavItem(Icons.person, 'Profile', false, Colors.grey),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, Color activeColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? activeColor : Colors.grey,
        ),
        Text(
          label,
          style: TextStyle(
            color: isActive ? activeColor : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
