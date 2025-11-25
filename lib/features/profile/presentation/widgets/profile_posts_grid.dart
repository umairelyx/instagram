import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
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
        crossAxisCount: AppDimensions.gridColumns,
        mainAxisSpacing: AppDimensions.gridSpacing,
        crossAxisSpacing: AppDimensions.gridSpacing,
      ),
      itemBuilder: (context, index) {
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
                    color: AppColors.errorBackground,
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        color: AppColors.errorIcon,
                        size: AppDimensions.iconXXLarge,
                      ),
                    ),
                  );
                },
              ),
              if (isVideo)
                const Positioned(
                  top: AppDimensions.spacingSmall2,
                  right: AppDimensions.spacingSmall2,
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColors.iconPrimary,
                    size: AppDimensions.iconSmall2,
                  ),
                ),
              if (hasMultiple && !isVideo)
                const Positioned(
                  top: AppDimensions.spacingSmall2,
                  right: AppDimensions.spacingSmall2,
                  child: Icon(
                    Icons.copy,
                    color: AppColors.iconPrimary,
                    size: AppDimensions.iconXSmall3,
                  ),
                ),
              if (isPinned)
                const Positioned(
                  top: AppDimensions.spacingSmall2,
                  left: AppDimensions.spacingSmall2,
                  child: Icon(
                    Icons.push_pin,
                    color: AppColors.iconPrimary,
                    size: AppDimensions.iconXSmall3,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
