import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headers
  static const title = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const titleMedium = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Body text
  static const body = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const bodyBold = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const bodySmall = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  // Small text
  static const small = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const smallBold = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  // Story text styles
  static const storyUsername = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const storyTimestamp = TextStyle(
    color: Color(0xB3FFFFFF), // 70% white
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const storyAction = TextStyle(
    color: Color(0xCCFFFFFF), // 80% white
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Profile username
  static const profileUsername = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const profileName = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const profileCategory = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static const profileLink = TextStyle(
    color: AppColors.linkBlueDark,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // Stats
  static const statsCount = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const statsLabel = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // Button text
  static const button = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  // Caption text
  static const caption = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const captionUsername = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  // Highlight text
  static const highlightLabel = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // Count text
  static const countText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  // Link text
  static const linkText = TextStyle(
    color: AppColors.textTertiary,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Time text
  static const timeText = TextStyle(
    color: AppColors.textTertiary,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}
