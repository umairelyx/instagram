library profile_usecases;

/// Barrel file for profile domain use cases
/// 
/// This file exports all use cases for the profile feature.
/// Use cases represent single business operations.
/// 
/// Usage:
/// ```dart
/// import 'package:instagram/features/profile/domain/usecases/usecases.dart';
/// 
/// // Now you can use:
/// GetUserProfile getUserProfile;
/// GetUserPosts getUserPosts;
/// GetUserReels getUserReels;
/// GetUserStories getUserStories;
/// GetTaggedPosts getTaggedPosts;
/// ```

export 'get_user_profile.dart';
export 'get_user_posts.dart';
export 'get_user_reels.dart';
export 'get_user_stories.dart';
export 'get_tagged_posts.dart';
