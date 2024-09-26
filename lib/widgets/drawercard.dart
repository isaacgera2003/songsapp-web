import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;

  const DrawerTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon, size: 28, color: Colors.black54),
          const SizedBox(width: 16),
          Text(
            title,
            style: GoogleFonts.inconsolata(
              fontSize: 22,
            ),
          ),
        ],
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }
}
