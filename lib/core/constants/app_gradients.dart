import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppGradients {
  // Story ring gradient (Instagram-style)
  static const LinearGradient storyRing = LinearGradient(
    colors: [
      AppColors.storyGradientStart,
      AppColors.storyGradientMiddle,
      AppColors.storyGradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Story overlay gradient (top)
  static LinearGradient storyOverlayTop = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.storyOverlay,
      Colors.transparent,
    ],
  );

  // Story overlay gradient (bottom)
  static LinearGradient storyOverlayBottom = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      AppColors.storyOverlay,
      Colors.transparent,
    ],
  );
}
