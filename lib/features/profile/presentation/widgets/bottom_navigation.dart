import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class InstagramBottomNavigation extends StatelessWidget {
  const InstagramBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.bottomNavHeight,
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(
          top: BorderSide(
            color: AppColors.bottomNavBorder,
            width: AppDimensions.borderThin,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.home,
            color: AppColors.iconPrimary,
            size: AppDimensions.iconLarge,
          ),
          const Icon(
            Icons.search,
            color: AppColors.iconPrimary,
            size: AppDimensions.iconLarge,
          ),
          const Icon(
            Icons.add_box_outlined,
            color: AppColors.iconPrimary,
            size: AppDimensions.iconLarge,
          ),
          const Icon(
            Icons.video_library_outlined,
            color: AppColors.iconPrimary,
            size: AppDimensions.iconLarge,
          ),
          Container(
            width: AppDimensions.avatarMedium,
            height: AppDimensions.avatarMedium,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.iconPrimary,
                width: AppDimensions.borderXThick,
              ),
              color: AppColors.buttonPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
