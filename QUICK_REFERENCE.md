# 🚀 Quick Reference Guide - Centralized Constants

## 📋 Cheat Sheet for Developers

---

## 🎨 Colors

```dart
import '../../../../core/constants/app_colors.dart';

// Background
AppColors.background              // Black background
AppColors.profileBackground       // Grey background

// Text
AppColors.textPrimary            // White text
AppColors.textSecondary          // Grey text
AppColors.textTertiary           // Light grey text

// Icons
AppColors.iconPrimary            // White icons
AppColors.iconSecondary          // Grey icons

// Brand
AppColors.blue                   // Instagram blue
AppColors.linkBlue               // Link blue
AppColors.red                    // Like red

// Borders
AppColors.border                 // Dark grey border
AppColors.borderLight            // Light grey border

// Story
AppColors.storyGradientStart     // Purple
AppColors.storyGradientMiddle    // Orange
AppColors.storyGradientEnd       // Pink
AppColors.storyProgressActive    // White
AppColors.storyProgressInactive  // 30% white
```

---

## 📏 Dimensions

```dart
import '../../../../core/constants/app_dimensions.dart';

// Spacing (use these instead of numbers!)
AppDimensions.spacingXSmall      // 2.0
AppDimensions.spacingSmall       // 6.0
AppDimensions.spacingMedium      // 10.0
AppDimensions.spacingLarge       // 16.0
AppDimensions.spacingXLarge      // 20.0
AppDimensions.spacingXXLarge     // 24.0

// Profile Pictures
AppDimensions.profilePictureLarge   // 90.0
AppDimensions.profilePictureMedium  // 70.0
AppDimensions.profilePictureSmall   // 35.0

// Icons
AppDimensions.iconSmall          // 18.0
AppDimensions.iconMedium         // 24.0
AppDimensions.iconLarge          // 28.0
AppDimensions.iconXLarge         // 32.0

// Border Radius
AppDimensions.radiusSmall        // 8.0
AppDimensions.radiusMedium       // 12.0
AppDimensions.radiusLarge        // 25.0

// Borders
AppDimensions.borderNormal       // 1.0
AppDimensions.borderThick        // 1.5
AppDimensions.borderXThick       // 2.0

// Buttons
AppDimensions.buttonHeightSmall  // 32.0
AppDimensions.buttonHeightMedium // 40.0

// Grid
AppDimensions.gridSpacing        // 2.0
AppDimensions.gridColumns        // 3
```

---

## ✍️ Text Styles

```dart
import '../../../../core/constants/app_text_styles.dart';

// Headers
AppTextStyles.title              // 20px, Bold
AppTextStyles.titleMedium        // 16px, W500

// Body
AppTextStyles.body               // 14px, Normal
AppTextStyles.bodyBold           // 14px, W600
AppTextStyles.bodySmall          // 13px, Normal

// Profile
AppTextStyles.profileUsername    // 22px, W600
AppTextStyles.profileName        // 14px, W600
AppTextStyles.profileCategory    // 13px, Normal
AppTextStyles.profileLink        // 14px, W400

// Stats
AppTextStyles.statsCount         // 18px, Bold
AppTextStyles.statsLabel         // 12px, Normal

// Story
AppTextStyles.storyUsername      // 14px, W600
AppTextStyles.storyTimestamp     // 12px, Normal

// Other
AppTextStyles.button             // 14px, W600
AppTextStyles.caption            // 14px, Normal
AppTextStyles.countText          // 12px, W600
AppTextStyles.small              // 12px, Normal
```

---

## 🌈 Gradients

```dart
import '../../../../core/constants/app_gradients.dart';

// Story ring gradient
AppGradients.storyRing           // Purple → Orange → Pink

// Overlays
AppGradients.storyOverlayTop     // Black → Transparent
AppGradients.storyOverlayBottom  // Black → Transparent
```

---

## ⏱️ Durations

```dart
import '../../../../core/constants/app_durations.dart';

// Story
AppDurations.storyDuration       // 5 seconds

// Animations
AppDurations.animationFast       // 200ms
AppDurations.animationNormal     // 300ms
AppDurations.animationSlow       // 500ms
```

---

## 💡 Common Patterns

### Container with Background
```dart
Container(
  color: AppColors.background,
  padding: EdgeInsets.all(AppDimensions.spacingLarge),
  child: ...
)
```

### Text with Style
```dart
Text(
  'Username',
  style: AppTextStyles.profileUsername,
)
```

### Icon with Size
```dart
Icon(
  Icons.home,
  color: AppColors.iconPrimary,
  size: AppDimensions.iconMedium,
)
```

### Padding
```dart
Padding(
  padding: EdgeInsets.symmetric(
    horizontal: AppDimensions.spacingLarge,
    vertical: AppDimensions.spacingMedium,
  ),
  child: ...
)
```

### Border
```dart
Border.all(
  color: AppColors.border,
  width: AppDimensions.borderNormal,
)
```

### Border Radius
```dart
BorderRadius.circular(AppDimensions.radiusSmall)
```

### Spacing
```dart
SizedBox(width: AppDimensions.spacingSmall)
SizedBox(height: AppDimensions.spacingMedium)
```

### Gradient Container
```dart
Container(
  decoration: BoxDecoration(
    gradient: AppGradients.storyRing,
    shape: BoxShape.circle,
  ),
)
```

---

## 🔍 Finding the Right Constant

### Need a Color?
1. Check `AppColors` first
2. Look for semantic names (textPrimary, iconPrimary)
3. Check category (story*, profile*, button*)

### Need a Size?
1. Check `AppDimensions` first
2. Look for spacing* (padding/margin)
3. Look for icon* (icon sizes)
4. Look for profile* (profile-specific)

### Need a Text Style?
1. Check `AppTextStyles` first
2. Look for semantic names (body, title, caption)
3. Check feature-specific (profile*, story*, stats*)

### Need a Gradient?
1. Check `AppGradients`
2. Currently: storyRing, overlays

### Need a Duration?
1. Check `AppDurations`
2. Story or animation durations

---

## ❌ Don't Do This

```dart
// ❌ Hardcoded colors
color: Colors.white
color: Colors.black
color: Color(0xFF0095F6)

// ❌ Magic numbers
padding: EdgeInsets.all(16)
size: 28
width: 90

// ❌ Inline text styles
style: TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.w600,
)

// ❌ Inline gradients
gradient: LinearGradient(
  colors: [Colors.purple, Colors.orange],
)
```

---

## ✅ Do This Instead

```dart
// ✅ Use constants
color: AppColors.textPrimary
color: AppColors.background
color: AppColors.blue

// ✅ Use dimensions
padding: EdgeInsets.all(AppDimensions.spacingLarge)
size: AppDimensions.iconLarge
width: AppDimensions.profilePictureLarge

// ✅ Use text styles
style: AppTextStyles.bodyBold

// ✅ Use gradients
gradient: AppGradients.storyRing
```

---

## 🎯 Import Template

```dart
// At the top of your widget file
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_gradients.dart';  // If needed
import '../../../../core/constants/app_durations.dart';  // If needed
```

---

## 📱 Widget Template

```dart
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_text_styles.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.all(AppDimensions.spacingLarge),
      child: Column(
        children: [
          Text(
            'Title',
            style: AppTextStyles.title,
          ),
          SizedBox(height: AppDimensions.spacingMedium),
          Icon(
            Icons.home,
            color: AppColors.iconPrimary,
            size: AppDimensions.iconMedium,
          ),
        ],
      ),
    );
  }
}
```

---

## 🔄 Migration Checklist

When updating existing code:

- [ ] Replace `Colors.*` with `AppColors.*`
- [ ] Replace hardcoded numbers with `AppDimensions.*`
- [ ] Replace inline `TextStyle` with `AppTextStyles.*`
- [ ] Replace inline gradients with `AppGradients.*`
- [ ] Replace `Duration` values with `AppDurations.*`
- [ ] Add proper imports at the top
- [ ] Test the changes
- [ ] Run `flutter analyze`

---

## 📚 Full Documentation

For complete details, see:
- `CONSTANTS_ARCHITECTURE.md` - Full architecture guide
- `BEFORE_AFTER_COMPARISON.md` - Code comparisons
- `CENTRALIZATION_COMPLETE.md` - Project summary

---

**Keep this guide handy while coding! 📌**

**Last Updated**: November 25, 2025  
**Status**: ✅ Production Ready
