import 'package:flutter/material.dart';

class ProfileBio extends StatelessWidget {
  final String category;
  final String bio;
  final String link;

  const ProfileBio({
    super.key,
    required this.category,
    required this.bio,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Google",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            category,
            style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(bio, style: const TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 4),
          Row(
            children: [
              Transform.rotate(
                angle: -0.55, // PERFECT IG tilt
                child: Icon(Icons.link, color: Color(0xFF0095F6), size: 14),
              ),
              const SizedBox(width: 4),
              Text(
                link,
                style: const TextStyle(
                  color: Color(0xFF0095F6),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Followed by section
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1.5),
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Positioned(
                    left: 12,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                    children: const [
                      TextSpan(text: "Followed by "),
                      TextSpan(
                        text: "kushalharsora",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: ", "),
                      TextSpan(
                        text: "arya_madan45",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "39 others",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
