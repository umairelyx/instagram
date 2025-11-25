library constants;

/// Barrel file for all core constants
/// 
/// This file exports all constant definitions used throughout the app.
/// Import this single file instead of importing individual constant files.
/// 
/// Usage:
/// ```dart
/// import 'package:instagram/core/constants/constants.dart';
/// 
/// // Now you can use:
/// AppColors.background
/// AppDimensions.spacingLarge
/// AppTextStyles.title
/// AppGradients.storyRing
/// AppDurations.storyDuration
/// ```

export 'app_colors.dart';
export 'app_dimensions.dart';
export 'app_text_styles.dart';
export 'app_gradients.dart';
export 'app_durations.dart';
export 'app_theme.dart';
