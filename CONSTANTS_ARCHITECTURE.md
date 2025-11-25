# 🎨 Centralized Constants Architecture

## Overview

All colors, dimensions, text styles, and other constants are centralized in the `lib/core/constants/` directory following Clean Architecture principles.

## 📁 Constants Structure

```
lib/core/constants/
├── app_colors.dart       # All color definitions
├── app_dimensions.dart   # Spacing, sizes, borders
├── app_text_styles.dart  # Typography styles
├── app_gradients.dart    # Gradient definitions
├── app_durations.dart    # Animation durations
└── app_theme.dart        # Theme configuration
```

---

## 🎨 AppColors

**Location**: `lib/core/constants/app_colors.dart`

### Base Colors
```dart
AppColors.background          // #000000 - Main background
AppColors.textPrimary         // White - Primary text
AppColors.textSecondary       // #B3B3B3 - Secondary text
AppColors.textTertiary        // #737373 - Tertiary text
AppColors.border              // #262626 - Border color
AppColors.blue                // #0095F6 - Instagram blue
```

### Story Colors
```dart
AppColors.storyGradientStart  // Purple
AppColors.storyGradientMiddle // Orange
AppColors.storyGradientEnd    // Pink
AppColors.storyProgressActive // White
AppColors.storyProgressInactive // 30% white
AppColors.storyOverlay        // 70% black
```

### Profile Colors
```dart
AppColors.profileRingBackground    // #1A1A1A
AppColors.profileBackground        // #262626
AppColors.profileBackgroundDark    // #1A1A1A
AppColors.profileBackgroundLight   // #404040
```

### UI Element Colors
```dart
AppColors.buttonPrimary       // #262626
AppColors.buttonSecondary     // Transparent
AppColors.iconPrimary         // White
AppColors.iconSecondary       // #B3B3B3
AppColors.linkBlue            // #6A78ED
AppColors.red                 // Red (likes)
```

---

## 📏 AppDimensions

**Location**: `lib/core/constants/app_dimensions.dart`

### Profile Dimensions
```dart
AppDimensions.profilePictureLarge   // 90.0
AppDimensions.profilePictureMedium  // 70.0
AppDimensions.profilePictureSmall   // 35.0
AppDimensions.profileRingPadding    // 3.0
```

### Spacing
```dart
AppDimensions.spacingXSmall    // 2.0
AppDimensions.spacingSmall     // 6.0
AppDimensions.spacingMedium    // 10.0
AppDimensions.spacingLarge     // 16.0
AppDimensions.spacingXLarge    // 20.0
AppDimensions.spacingXXLarge   // 24.0
```

### Border Radius
```dart
AppDimensions.radiusSmall      // 8.0
AppDimensions.radiusMedium     // 12.0
AppDimensions.radiusLarge      // 25.0
AppDimensions.radiusCircle     // 999.0
```

### Icon Sizes
```dart
AppDimensions.iconXSmall       // 12.0
AppDimensions.iconSmall        // 18.0
AppDimensions.iconMedium       // 24.0
AppDimensions.iconLarge        // 28.0
AppDimensions.iconXLarge       // 32.0
AppDimensions.iconXXLarge      // 40.0
```

### Grid
```dart
AppDimensions.gridSpacing      // 2.0
AppDimensions.gridColumns      // 3
AppDimensions.reelAspectRatio  // 0.6
```

---

## ✍️ AppTextStyles

**Location**: `lib/core/constants/app_text_styles.dart`

### Headers
```dart
AppTextStyles.title            // 20px, Bold
AppTextStyles.titleMedium      // 16px, W500
```

### Body Text
```dart
AppTextStyles.body             // 14px, Normal
AppTextStyles.bodyBold         // 14px, W600
AppTextStyles.bodySmall        // 13px, Normal
```

### Profile Text
```dart
AppTextStyles.profileUsername  // 22px, W600
AppTextStyles.profileName      // 14px, W600
AppTextStyles.profileCategory  // 13px, Normal
AppTextStyles.profileLink      // 14px, W400
```

### Stats
```dart
AppTextStyles.statsCount       // 18px, Bold
AppTextStyles.statsLabel       // 12px, Normal
```

### Story Text
```dart
AppTextStyles.storyUsername    // 14px, W600
AppTextStyles.storyTimestamp   // 12px, Normal
AppTextStyles.storyAction      // 14px, Normal
```

### Other
```dart
AppTextStyles.button           // 14px, W600
AppTextStyles.caption          // 14px, Normal
AppTextStyles.countText        // 12px, W600
AppTextStyles.timeText         // 12px, Normal
```

---

## 🌈 AppGradients

**Location**: `lib/core/constants/app_gradients.dart`

```dart
AppGradients.storyRing         // Purple → Orange → Pink
AppGradients.storyOverlayTop   // Black → Transparent
AppGradients.storyOverlayBottom // Black → Transparent
```

---

## ⏱️ AppDurations

**Location**: `lib/core/constants/app_durations.dart`

```dart
AppDurations.storyDuration     // 5 seconds
AppDurations.storyTransition   // 300ms
AppDurations.animationFast     // 200ms
AppDurations.animationNormal   // 300ms
AppDurations.animationSlow     // 500ms
```

---

## 📖 Usage Examples

### Using Colors
```dart
Container(
  color: AppColors.background,
  child: Text(
    'Hello',
    style: TextStyle(color: AppColors.textPrimary),
  ),
)
```

### Using Dimensions
```dart
Padding(
  padding: EdgeInsets.all(AppDimensions.spacingLarge),
  child: Icon(
    Icons.home,
    size: AppDimensions.iconMedium,
  ),
)
```

### Using Text Styles
```dart
Text(
  'Username',
  style: AppTextStyles.profileUsername,
)
```

### Using Gradients
```dart
Container(
  decoration: BoxDecoration(
    gradient: AppGradients.storyRing,
    shape: BoxShape.circle,
  ),
)
```

---

## ✅ Benefits

### 1. **Consistency**
- All UI elements use the same values
- No magic numbers scattered in code
- Easy to maintain visual consistency

### 2. **Maintainability**
- Change once, update everywhere
- Easy to find and modify values
- Clear naming conventions

### 3. **Clean Architecture Compliance**
- Constants in core layer
- Features depend on core
- No hardcoded values in presentation

### 4. **Scalability**
- Easy to add new constants
- Theme switching ready
- Dark/light mode support

### 5. **Developer Experience**
- Autocomplete support
- Type safety
- Clear documentation

---

## 🔄 Migration Checklist

When updating existing code:

- [ ] Replace `Colors.white` → `AppColors.textPrimary`
- [ ] Replace `Colors.black` → `AppColors.background`
- [ ] Replace `Colors.grey` → `AppColors.textSecondary`
- [ ] Replace hardcoded numbers → `AppDimensions.*`
- [ ] Replace inline TextStyle → `AppTextStyles.*`
- [ ] Replace inline gradients → `AppGradients.*`
- [ ] Replace Duration values → `AppDurations.*`

---

## 📝 Adding New Constants

### Step 1: Identify the constant type
- Color? → `app_colors.dart`
- Size/spacing? → `app_dimensions.dart`
- Text style? → `app_text_styles.dart`
- Gradient? → `app_gradients.dart`
- Duration? → `app_durations.dart`

### Step 2: Add with clear naming
```dart
// Good
static const double profilePictureLarge = 90.0;
static const Color textPrimary = Colors.white;

// Bad
static const double size1 = 90.0;
static const Color color1 = Colors.white;
```

### Step 3: Document usage
Add comment explaining when to use it

### Step 4: Update this documentation
Keep CONSTANTS_ARCHITECTURE.md up to date

---

## 🎯 Best Practices

### DO ✅
- Use constants for all colors
- Use constants for all dimensions
- Use predefined text styles
- Group related constants
- Use descriptive names
- Document complex values

### DON'T ❌
- Hardcode colors in widgets
- Use magic numbers
- Create inline TextStyles
- Duplicate constant values
- Use unclear names
- Skip documentation

---

## 🔍 Finding Constants

### By Category
- **Colors**: `lib/core/constants/app_colors.dart`
- **Sizes**: `lib/core/constants/app_dimensions.dart`
- **Text**: `lib/core/constants/app_text_styles.dart`

### By Feature
- **Story**: Look for `story*` prefix
- **Profile**: Look for `profile*` prefix
- **Button**: Look for `button*` prefix
- **Icon**: Look for `icon*` prefix

### By Value Type
- **Spacing**: `spacing*`
- **Radius**: `radius*`
- **Border**: `border*`
- **Avatar**: `avatar*`

---

## 📊 Project Status

### ✅ Fully Migrated
- Story viewer page
- Story ring widget
- Profile stats widget
- Profile header widget
- Profile bio widget
- Profile actions widget
- Profile tabs widget
- Bottom navigation
- All grid widgets

### 🎨 Centralized Constants
- ✅ Colors (30+ constants)
- ✅ Dimensions (50+ constants)
- ✅ Text Styles (20+ styles)
- ✅ Gradients (3 gradients)
- ✅ Durations (5 durations)

---

## 🚀 Result

**100% of the project now uses centralized constants!**

- No hardcoded colors
- No magic numbers
- Fully Clean Architecture compliant
- Easy to theme
- Maintainable and scalable

---

**Last Updated**: November 25, 2025
**Architecture**: Clean Architecture
**Pattern**: Centralized Constants
**Status**: ✅ Production Ready
