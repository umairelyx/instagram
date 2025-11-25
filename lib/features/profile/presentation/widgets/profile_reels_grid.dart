import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
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
        crossAxisCount: AppDimensions.gridColumns,
        mainAxisSpacing: AppDimensions.gridSpacing,
        crossAxisSpacing: AppDimensions.gridSpacing,
        childAspectRatio: AppDimensions.reelAspectRatio,
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
                    color: AppColors.errorBackground,
                    child: const Center(
                      child: Icon(
                        Icons.video_library,
                        color: AppColors.errorIcon,
                        size: AppDimensions.iconXXLarge,
                      ),
                    ),
                  );
                },
              ),
              const Positioned(
                bottom: AppDimensions.spacingSmall2,
                left: AppDimensions.spacingSmall2,
                child: Icon(
                  Icons.play_arrow,
                  color: AppColors.iconPrimary,
                  size: AppDimensions.iconMedium,
                ),
              ),
              Positioned(
                bottom: AppDimensions.spacingSmall2,
                right: AppDimensions.spacingSmall2,
                child: Row(
                  children: [
                    const Icon(
                      Icons.play_arrow,
                      color: AppColors.iconPrimary,
                      size: AppDimensions.iconXSmall3,
                    ),
                    const SizedBox(width: AppDimensions.spacingXSmall),
                    Text(
                      '${(index + 1) * 123}K',
                      style: AppTextStyles.countText,
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
