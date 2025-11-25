import 'package:flutter/material.dart';
import '../../domain/entities/story.dart';
import '../pages/story_viewer_page.dart';

/// Reusable story ring widget that can be used anywhere
/// Shows gradient ring if user has active stories
class StoryRing extends StatelessWidget {
  final String profileImage;
  final String username;
  final List<Story> stories;
  final double size;
  final bool hasStory;

  const StoryRing({
    super.key,
    required this.profileImage,
    required this.username,
    required this.stories,
    this.size = 90,
    this.hasStory = true,
  });

  @override
  Widget build(BuildContext context) {
    final ringWidget = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: hasStory
            ? const LinearGradient(
                colors: [Colors.purple, Colors.orange, Colors.pink],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: hasStory ? null : Colors.grey.shade800,
      ),
      padding: const EdgeInsets.all(3),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        padding: const EdgeInsets.all(3),
        child: CircleAvatar(
          radius: (size - 12) / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: AssetImage(profileImage),
        ),
      ),
    );

    if (!hasStory || stories.isEmpty) {
      return ringWidget;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryViewerPage(
              stories: stories,
              username: username,
              profileImage: profileImage,
            ),
          ),
        );
      },
      child: ringWidget,
    );
  }
}
