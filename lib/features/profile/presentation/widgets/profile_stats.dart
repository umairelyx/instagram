import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'story_ring.dart';
import '../../domain/entities/story.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_dimensions.dart';

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
          style: AppTextStyles.statsCount,
        ),
        Text(
          label,
          style: AppTextStyles.statsLabel,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingLarge,
        vertical: AppDimensions.spacingSmall,
      ),
      child: Row(
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final stories = state is ProfileLoaded ? state.stories : <Story>[];
              return StoryRing(
                profileImage: profileImage,
                username: 'google',
                stories: stories,
                size: AppDimensions.profilePictureLarge,
                hasStory: stories.isNotEmpty,
              );
            },
          ),
          const SizedBox(width: AppDimensions.spacingXLarge),
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
