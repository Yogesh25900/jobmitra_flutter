import 'package:flutter/material.dart';

class RoleSwitch extends StatelessWidget {
  final bool isTalent;
  final Function(bool) onRoleChanged;

  const RoleSwitch({
    super.key,
    required this.isTalent,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          _roleButton("Talent", true),
          _roleButton("Recruiter", false),
        ],
      ),
    );
  }

  Widget _roleButton(String text, bool talent) {
    final selected = isTalent == talent;

    return Expanded(
      child: GestureDetector(
        onTap: () => onRoleChanged(talent),
        child: Container(
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: selected
                ? [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black.withOpacity(0.08),
                    )
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  selected ? const Color(0xFF136DEC) : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
