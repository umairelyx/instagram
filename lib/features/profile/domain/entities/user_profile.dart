class UserProfile {
  final String username;
  final bool isVerified;
  final int postsCount;
  final double followersCount; // millions support
  final int followingCount;
  final String profileImageUrl;
  final String category;     // Example: "Internet company"
  final String bio;          // Example: "Going bananas 🍌"
  final String link;         // Example: "linkin.bio/google"

  const UserProfile({
    required this.username,
    required this.isVerified,
    required this.postsCount,
    required this.followersCount,
    required this.followingCount,
    required this.profileImageUrl,
    required this.category,
    required this.bio,
    required this.link,
  });
}
