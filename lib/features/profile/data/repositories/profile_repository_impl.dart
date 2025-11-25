import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl({required this.localDataSource});

  @override
  Future<UserProfile> getUserProfile() async {
    // Get MODEL from datasource
    final UserProfileModel model = await localDataSource.getUserProfile();

    // Return ENTITY (models are already entities because they extend)
    return model;
  }

  @override
  Future<List<Post>> getUserPosts() async {
    // Get MODEL list from datasource
    final List<PostModel> models = await localDataSource.getUserPosts();

    // Return ENTITY list
    return models;
  }

  @override
  Future<List<Reel>> getUserReels() async {
    final List<ReelModel> models = await localDataSource.getUserReels();
    return models;
  }

  @override
  Future<List<TaggedPost>> getTaggedPosts() async {
    final List<TaggedPostModel> models = await localDataSource.getTaggedPosts();
    return models;
  }

  @override
  Future<List<Story>> getUserStories() async {
    final List<StoryModel> models = await localDataSource.getUserStories();
    return models;
  }
}
