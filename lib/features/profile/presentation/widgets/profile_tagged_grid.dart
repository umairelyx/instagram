import 'package:flutter/material.dart';
import '../pages/post_detail_page.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';

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
        crossAxisCount: AppDimensions.gridColumns,
        mainAxisSpacing: AppDimensions.gridSpacing,
        crossAxisSpacing: AppDimensions.gridSpacing,
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
                    color: AppColors.errorBackground,
                    child: const Center(
                      child: Icon(
                        Icons.person_pin,
                        color: AppColors.errorIcon,
                        size: AppDimensions.iconXXLarge,
                      ),
                    ),
                  );
                },
              ),
              const Positioned(
                top: AppDimensions.spacingSmall2,
                right: AppDimensions.spacingSmall2,
                child: Icon(
                  Icons.person_pin,
                  color: AppColors.iconPrimary,
                  size: AppDimensions.iconSmall2,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
