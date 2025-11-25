import '../entities/entities.dart';

abstract class ProfileRepository {
  Future<UserProfile> getUserProfile();
  Future<List<Post>> getUserPosts();
  Future<List<Reel>> getUserReels();
  Future<List<TaggedPost>> getTaggedPosts();
  Future<List<Story>> getUserStories();
}
