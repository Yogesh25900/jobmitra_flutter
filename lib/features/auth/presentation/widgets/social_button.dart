import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String iconUrl;

  const SocialButton({
    super.key,
    required this.text,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              iconUrl,
              height: 18,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  text == "Google" ? Icons.g_mobiledata : Icons.apple,
                  size: 18,
                  color: Colors.grey.shade600,
                );
              },
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
