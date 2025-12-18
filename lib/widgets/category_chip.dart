import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final IconData? icon;

  const CategoryChip({
    super.key,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.deepPurple[50],
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(icon, size: 16, color: Colors.deepPurple),
          if (icon != null) const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}
