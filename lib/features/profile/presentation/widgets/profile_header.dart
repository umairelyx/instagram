import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final bool isVerified;

  const ProfileHeader({
    super.key,
    required this.username,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          const Icon(Icons.lock_outline, color: Colors.white, size: 20),
          const SizedBox(width: 8),

          Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          if (isVerified) ...[
            const SizedBox(width: 6),
            const Icon(Icons.verified, color: Color(0xFF0095F6), size: 20),
          ],

          const Spacer(),

          const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(width: 20),
          const Icon(Icons.more_vert, color: Colors.white, size: 26),
        ],
      ),
    );
  }
}
