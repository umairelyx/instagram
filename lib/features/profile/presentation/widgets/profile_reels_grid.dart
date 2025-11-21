import 'package:flutter/material.dart';
import '../pages/reel_detail_page.dart';

class ProfileReelsGrid extends StatelessWidget {
  final List<String> reels;
  final List<String> videoUrls;

  const ProfileReelsGrid({
    super.key,
    required this.reels,
    required this.videoUrls,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reels.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.6, // Taller for reels
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReelDetailPage(
                  videoUrl: videoUrls[index],
                  reelIndex: index,
                ),
              ),
            );
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                reels[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade900,
                    child: Center(
                      child: Icon(
                        Icons.video_library,
                        color: Colors.grey.shade700,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
              // Play icon overlay
              const Positioned(
                bottom: 8,
                left: 8,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              // View count
              Positioned(
                bottom: 8,
                right: 8,
                child: Row(
                  children: [
                    const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${(index + 1) * 123}K',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
