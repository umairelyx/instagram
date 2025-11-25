import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  Widget _storyHighlight(String label, {bool hasStory = false}) {
    return Column(
      children: [
        Container(
          width: AppDimensions.storyHighlightSize,
          height: AppDimensions.storyHighlightSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: hasStory ? AppColors.border : Colors.transparent,
              width: AppDimensions.borderThick,
            ),
          ),
          child: Center(
            child: Container(
              width: AppDimensions.storyHighlightInner,
              height: AppDimensions.storyHighlightInner,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.profileBackgroundDark,
              ),
              child: const Icon(
                Icons.image_outlined,
                color: AppColors.iconTertiary,
                size: AppDimensions.iconLarge,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSmall),
        Text(
          label,
          style: AppTextStyles.highlightLabel,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Story Highlights
        Container(
          height: AppDimensions.storyHighlightHeight,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingLarge,
            vertical: AppDimensions.spacingSmall2,
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _storyHighlight("Nano Banana Pro", hasStory: true),
              const SizedBox(width: AppDimensions.spacingLarge),
              _storyHighlight("Gemini 3", hasStory: true),
              const SizedBox(width: AppDimensions.spacingLarge),
              _storyHighlight("AI Mode", hasStory: true),
              const SizedBox(width: AppDimensions.spacingLarge),
              _storyHighlight("More", hasStory: true),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSmall2),
        // Tabs
        const TabBar(
          indicatorColor: AppColors.iconPrimary,
          indicatorWeight: AppDimensions.borderNormal,
          labelColor: AppColors.iconPrimary,
          unselectedLabelColor: AppColors.iconSecondary,
          tabs: [
            Tab(icon: Icon(Icons.grid_on_outlined, size: AppDimensions.iconMedium)),
            Tab(icon: Icon(Icons.video_collection_outlined, size: AppDimensions.iconMedium)),
            Tab(icon: Icon(Icons.person_pin_outlined, size: AppDimensions.iconMedium)),
          ],
        ),
      ],
    );
  }
}
