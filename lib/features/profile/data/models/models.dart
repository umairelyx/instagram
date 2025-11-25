library profile_models;

/// Barrel file for profile data models
/// 
/// This file exports all data models for the profile feature.
/// Models extend entities and add serialization capabilities.
/// 
/// Usage:
/// ```dart
/// import 'package:instagram/features/profile/data/models/models.dart';
/// 
/// // Now you can use:
/// UserProfileModel profileModel;
/// PostModel postModel;
/// ReelModel reelModel;
/// StoryModel storyModel;
/// TaggedPostModel taggedModel;
/// ```

export 'user_profile_model.dart';
export 'post_model.dart';
export 'reel_model.dart';
export 'story_model.dart';
export 'tagged_post_model.dart';
