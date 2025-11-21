import 'package:flutter/material.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  Widget _btn(String text, {bool isPrimary = false}) {
    return Expanded(
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: isPrimary ? Colors.grey.shade800 : Colors.transparent,
          border: Border.all(color: Colors.grey.shade700, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconBtn(IconData icon) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _btn("Following", isPrimary: true),
          const SizedBox(width: 6),
          _btn("Message"),
          const SizedBox(width: 6),
          _iconBtn(Icons.person_add_outlined),
        ],
      ),
    );
  }
}
