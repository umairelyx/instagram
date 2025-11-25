import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  Widget _btn(String text, {bool isPrimary = false}) {
    return Expanded(
      child: Container(
        height: AppDimensions.buttonHeightSmall,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.buttonPrimary : AppColors.buttonSecondary,
          border: Border.all(
            color: AppColors.border,
            width: AppDimensions.borderNormal,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.button,
          ),
        ),
      ),
    );
  }

  Widget _iconBtn(IconData icon) {
    return Container(
      width: AppDimensions.buttonHeightSmall,
      height: AppDimensions.buttonHeightSmall,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.border,
          width: AppDimensions.borderNormal,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
      ),
      child: Icon(
        icon,
        color: AppColors.iconPrimary,
        size: AppDimensions.iconSmall,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingLarge,
      ),
      child: Row(
        children: [
          _btn("Following", isPrimary: true),
          const SizedBox(width: AppDimensions.spacingSmall),
          _btn("Message"),
          const SizedBox(width: AppDimensions.spacingSmall),
          _iconBtn(Icons.person_add_outlined),
        ],
      ),
    );
  }
}
