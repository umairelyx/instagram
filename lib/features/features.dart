library features;

/// Barrel file for all features
/// 
/// This file exports all feature modules in the application.
/// Each feature follows Clean Architecture with domain, data, and presentation layers.
/// 
/// Usage:
/// ```dart
/// import 'package:instagram/features/features.dart';
/// 
/// // Access all features
/// ```

export 'profile/profile.dart';

// Future features can be added here:
// export 'feed/feed.dart';
// export 'search/search.dart';
// export 'messaging/messaging.dart';
// export 'notifications/notifications.dart';
