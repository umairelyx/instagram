import 'package:flutter/material.dart';

class InstagramBottomNavigation extends StatelessWidget {
  const InstagramBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: Colors.grey.shade900, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.home, color: Colors.white, size: 28),
          const Icon(Icons.search, color: Colors.white, size: 28),
          const Icon(Icons.add_box_outlined, color: Colors.white, size: 28),
          const Icon(Icons.video_library_outlined, color: Colors.white, size: 28),
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
