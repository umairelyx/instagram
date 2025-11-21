import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final int posts;
  final double followers;
  final int following;
  final String profileImage;

  const ProfileStats({
    super.key,
    required this.posts,
    required this.followers,
    required this.following,
    required this.profileImage,
  });

  Widget _item(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Colors.purple, Colors.orange, Colors.pink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(3),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey.shade800,
                backgroundImage: AssetImage(profileImage),
              ),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(posts.toString(), "posts"),
                _item("${followers}M", "followers"),
                _item(following.toString(), "following"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
