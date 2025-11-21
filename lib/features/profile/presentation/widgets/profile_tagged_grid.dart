import 'package:flutter/material.dart';
import '../pages/post_detail_page.dart';

class ProfileTaggedGrid extends StatelessWidget {
  final List<String> tagged;

  const ProfileTaggedGrid({
    super.key,
    required this.tagged,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tagged.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailPage(
                  imageUrl: tagged[index],
                  postIndex: index,
                ),
              ),
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                tagged[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade900,
                    child: Center(
                      child: Icon(
                        Icons.person_pin,
                        color: Colors.grey.shade700,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
              // Person pin icon overlay
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.person_pin,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
