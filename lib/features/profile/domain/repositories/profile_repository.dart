import '../entities/user_profile.dart';
import '../entities/post.dart';
import '../entities/reel.dart';
import '../entities/tagged_post.dart';
import '../entities/story.dart';

abstract class ProfileRepository {
  Future<UserProfile> getUserProfile();
  Future<List<Post>> getUserPosts();
  Future<List<Reel>> getUserReels();
  Future<List<TaggedPost>> getTaggedPosts();
  Future<List<Story>> getUserStories();
}
