import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';

class ProfileBio extends StatelessWidget {
  final String category;
  final String bio;
  final String link;

  const ProfileBio({
    super.key,
    required this.category,
    required this.bio,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Google",
            style: AppTextStyles.profileName,
          ),
          const SizedBox(height: AppDimensions.spacingXSmall),
          Text(
            category,
            style: AppTextStyles.profileCategory,
          ),
          const SizedBox(height: AppDimensions.spacingXSmall2),
          Text(
            bio,
            style: AppTextStyles.body,
          ),
          const SizedBox(height: AppDimensions.spacingXSmall2),
          Row(
            children: [
              Transform.rotate(
                angle: -0.55,
                child: const Icon(
                  Icons.link,
                  color: AppColors.linkBlue,
                  size: AppDimensions.iconXSmall2,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingXSmall2),
              Text(
                link,
                style: AppTextStyles.profileLink,
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingMedium2),
          // Followed by section
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: AppDimensions.avatarSmall,
                    height: AppDimensions.avatarSmall,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.background,
                        width: AppDimensions.borderThick,
                      ),
                      color: AppColors.profileBackgroundLight,
                    ),
                  ),
                  Positioned(
                    left: AppDimensions.spacingMedium2,
                    child: Container(
                      width: AppDimensions.avatarSmall,
                      height: AppDimensions.avatarSmall,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.background,
                          width: AppDimensions.borderThick,
                        ),
                        color: AppColors.profileBackground,
                      ),
                    ),
                  ),
                  Positioned(
                    left: AppDimensions.spacingXXLarge,
                    child: Container(
                      width: AppDimensions.avatarSmall,
                      height: AppDimensions.avatarSmall,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.background,
                          width: AppDimensions.borderThick,
                        ),
                        color: AppColors.profileBackgroundDark,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: AppDimensions.buttonHeightLarge),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: AppTextStyles.profileCategory,
                    children: [
                      TextSpan(text: "Followed by "),
                      TextSpan(
                        text: "kushalharsora",
                        style: AppTextStyles.profileName,
                      ),
                      TextSpan(text: ", "),
                      TextSpan(
                        text: "arya_madan45",
                        style: AppTextStyles.profileName,
                      ),
                      TextSpan(text: " and "),
                      TextSpan(
                        text: "39 others",
                        style: AppTextStyles.profileName,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingLarge),
        ],
      ),
    );
  }
}
