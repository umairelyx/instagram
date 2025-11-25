# 📖 Instagram Story Feature

## Overview

Instagram-style story viewer with Clean Architecture integration.

## Features

- ✅ Tap profile picture to view stories
- ✅ Auto-advance every 5 seconds
- ✅ Tap left/right to navigate
- ✅ Long-press to pause/resume
- ✅ Progress bars showing position
- ✅ Real timestamp display (2h, 5m, now)
- ✅ Full-screen display with Instagram UI
- ✅ Gradient ring indicates active stories

## Usage

### Viewing Stories
1. Tap profile picture (with gradient ring)
2. Story opens full-screen
3. Tap right → next story
4. Tap left → previous story
5. Long-press → pause/resume
6. Auto-closes after last story

### Adding Stories
Add images to `assets/story/` folder. Stories are loaded via:
```
ProfileCubit → GetUserStories → ProfileRepository → DataSource
```

## Architecture

### Clean Architecture Layers

**Domain Layer:**
- `entities/story.dart` - Story entity
- `usecases/get_user_stories.dart` - Use case
- `repositories/profile_repository.dart` - Interface

**Data Layer:**
- `models/story_model.dart` - Data model
- `datasources/profile_local_datasource.dart` - Data source
- `repositories/profile_repository_impl.dart` - Implementation

**Presentation Layer:**
- `pages/story_viewer_page.dart` - Story viewer UI
- `widgets/story_ring.dart` - Profile picture with ring
- `cubit/profile_cubit.dart` - State management
- `cubit/profile_state.dart` - State definitions

## Technical Details

### Story Entity
```dart
class Story {
  final String id;
  final String imageUrl;
  final DateTime timestamp;
}
```

### Controls
- **Timer**: Auto-advances every 5 seconds
- **AnimationController**: Progress bar animation
- **GestureDetector**: Tap and long-press handling
- **Timestamp**: Real-time calculation

### UI Components
- Progress bars (top)
- Profile header with timestamp
- Full-screen story image
- Bottom actions (message, like, share)
- Gradient overlays
- Close button

## Future Enhancements

- Story replies/reactions
- Story sharing
- Multiple user stories
- Video stories
- Story creation
- Story analytics

---

**Status**: ✅ Production-ready
