import 'package:flutter/material.dart';
import '../../domain/entities/story.dart';
import '../pages/story_viewer_page.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_gradients.dart';

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
    this.size = AppDimensions.profilePictureLarge,
    this.hasStory = true,
  });

  @override
  Widget build(BuildContext context) {
    final ringWidget = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: hasStory ? AppGradients.storyRing : null,
        color: hasStory ? null : AppColors.profileBackground,
      ),
      padding: const EdgeInsets.all(AppDimensions.profileRingPadding),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.profileRingBackground,
        ),
        padding: const EdgeInsets.all(AppDimensions.profileRingPadding),
        child: CircleAvatar(
          radius: (size - 12) / 2,
          backgroundColor: AppColors.profileBackground,
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
