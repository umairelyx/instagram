import '../models/models.dart';

abstract class ProfileLocalDataSource {
  Future<UserProfileModel> getUserProfile();
  Future<List<PostModel>> getUserPosts();
  Future<List<ReelModel>> getUserReels();
  Future<List<TaggedPostModel>> getTaggedPosts();
  Future<List<StoryModel>> getUserStories();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  Future<UserProfileModel> getUserProfile() async {
    // Mock data (like a JSON response)
    final Map<String, dynamic> map = {
      "username": "google",
      "isVerified": true,
      "postsCount": 3000,
      "followersCount": 15.7, // million
      "followingCount": 40,
      "profileImageUrl": "assets/images/profile/user.png",
      "category": "Internet company",
      "bio": "Going bananas 🍌",
      "link": "linkin.bio/google",
    };

    return UserProfileModel.fromMap(map);
  }

  @override
  Future<List<PostModel>> getUserPosts() async {
    // Mock list of images
    final List<Map<String, dynamic>> rawPosts = [
      {"imageUrl": "assets/images/posts/post_1.jpg"},
      {"imageUrl": "assets/images/posts/post_2.jpg"},
      {"imageUrl": "assets/images/posts/post_3.jpg"},
      {"imageUrl": "assets/images/posts/post_4.jpg"},
      {"imageUrl": "assets/images/posts/post_5.jpg"},
      {"imageUrl": "assets/images/posts/post_6.jpg"},
      {"imageUrl": "assets/images/posts/post_7.jpg"},
      {"imageUrl": "assets/images/posts/post_8.jpg"},
      {"imageUrl": "assets/images/posts/post_9.jpg"},
    ];

    return rawPosts.map((map) => PostModel.fromMap(map)).toList();
  }

  @override
  Future<List<ReelModel>> getUserReels() async {
    // List of reels matching actual video files
    final List<Map<String, dynamic>> rawReels = [
      {
        "videoUrl": "assets/videos/reels/reel_1.mp4",
        "thumbnailUrl": "assets/images/posts/post_1.jpg",
        "viewCount": 523000,
      },
      {
        "videoUrl": "assets/videos/reels/reel_2.mp4",
        "thumbnailUrl": "assets/images/posts/post_2.jpg",
        "viewCount": 847000,
      },
    ];

    return rawReels.map((map) => ReelModel.fromMap(map)).toList();
  }

  @override
  Future<List<TaggedPostModel>> getTaggedPosts() async {
    // Mock list of tagged posts
    final List<Map<String, dynamic>> rawTagged = [
      {
        "imageUrl": "assets/tagged/tagged_1.jpg",
        "taggedUsername": "google",
      },
      {
        "imageUrl": "assets/tagged/tagged_2.jpg",
        "taggedUsername": "google",
      },
      {
        "imageUrl": "assets/images/posts/post_7.jpg",
        "taggedUsername": "googlegemini",
      },
      {
        "imageUrl": "assets/images/posts/post_8.jpg",
        "taggedUsername": "googlegemini",
      },
    ];

    return rawTagged.map((map) => TaggedPostModel.fromMap(map)).toList();
  }

  @override
  Future<List<StoryModel>> getUserStories() async {
    // Mock list of stories
    final List<Map<String, dynamic>> rawStories = [
      {
        "id": "1",
        "imageUrl": "assets/story/story_1.jpg",
        "timestamp": DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
      },
    ];

    return rawStories.map((map) => StoryModel.fromJson(map)).toList();
  }
}
