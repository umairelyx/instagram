import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';

class ProfileHeader extends StatelessWidget {
  final String username;
  final bool isVerified;

  const ProfileHeader({
    super.key,
    required this.username,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingLarge,
        vertical: AppDimensions.spacingMedium,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.lock_outline,
            color: AppColors.iconPrimary,
            size: AppDimensions.iconSmall2,
          ),
          const SizedBox(width: AppDimensions.spacingSmall2),
          Text(
            username,
            style: AppTextStyles.profileUsername,
          ),
          if (isVerified) ...[
            const SizedBox(width: AppDimensions.spacingSmall),
            const Icon(
              Icons.verified,
              color: AppColors.blue,
              size: AppDimensions.iconSmall2,
            ),
          ],
          const Spacer(),
          const Icon(
            Icons.notifications_outlined,
            color: AppColors.iconPrimary,
            size: AppDimensions.iconMedium2,
          ),
          const SizedBox(width: AppDimensions.spacingXLarge),
          const Icon(
            Icons.more_vert,
            color: AppColors.iconPrimary,
            size: AppDimensions.iconMedium2,
          ),
        ],
      ),
    );
  }
}
