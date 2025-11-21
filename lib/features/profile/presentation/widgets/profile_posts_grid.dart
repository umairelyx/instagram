import 'package:flutter/material.dart';
import '../pages/post_detail_page.dart';

class ProfilePostsGrid extends StatelessWidget {
  final List<String> posts;

  const ProfilePostsGrid({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        // Add variety to posts
        final bool isVideo = index % 4 == 0;
        final bool hasMultiple = index % 5 == 0;
        final bool isPinned = index == 0;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostDetailPage(
                  imageUrl: posts[index],
                  postIndex: index,
                ),
              ),
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
            Image.asset(
              posts[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade900,
                  child: Center(
                    child: Icon(
                      Icons.image,
                      color: Colors.grey.shade700,
                      size: 40,
                    ),
                  ),
                );
              },
            ),
            // Video indicator
            if (isVideo)
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            // Multiple images indicator
            if (hasMultiple && !isVideo)
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.copy,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            // Pinned indicator
            if (isPinned)
              const Positioned(
                top: 8,
                left: 8,
                child: Icon(
                  Icons.push_pin,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
