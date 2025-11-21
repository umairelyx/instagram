import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const medium = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const body = TextStyle(color: AppColors.textPrimary, fontSize: 14);

  static const small = TextStyle(color: AppColors.textSecondary, fontSize: 12);
}
