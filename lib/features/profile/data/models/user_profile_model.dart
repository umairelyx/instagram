import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.username,
    required super.isVerified,
    required super.postsCount,
    required super.followersCount,
    required super.followingCount,
    required super.profileImageUrl,
    required super.category,
    required super.bio,
    required super.link,
  });

  /// Convert JSON/map → Model
  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      username: map['username'] ?? '',
      isVerified: map['isVerified'] ?? false,
      postsCount: map['postsCount']?.toInt() ?? 0,
      followersCount: (map['followersCount'] ?? 0).toDouble(),
      followingCount: map['followingCount']?.toInt() ?? 0,
      profileImageUrl: map['profileImageUrl'] ?? '',
      category: map['category'] ?? '',
      bio: map['bio'] ?? '',
      link: map['link'] ?? '',
    );
  }

  /// Convert Model → Map (useful for local caches)
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'isVerified': isVerified,
      'postsCount': postsCount,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'profileImageUrl': profileImageUrl,
      'category': category,
      'bio': bio,
      'link': link,
    };
  }
}
