library profile_entities;

/// Barrel file for profile domain entities
/// 
/// This file exports all domain entities for the profile feature.
/// Entities represent pure business objects with no dependencies.
/// 
/// Usage:
/// ```dart
/// import 'package:instagram/features/profile/domain/entities/entities.dart';
/// 
/// // Now you can use:
/// UserProfile profile;
/// Post post;
/// Reel reel;
/// Story story;
/// TaggedPost tagged;
/// ```

export 'user_profile.dart';
export 'post.dart';
export 'reel.dart';
export 'story.dart';
export 'tagged_post.dart';
