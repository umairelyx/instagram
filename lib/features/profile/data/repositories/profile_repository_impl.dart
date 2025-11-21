import '../../domain/entities/user_profile.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/reel.dart';
import '../../domain/entities/tagged_post.dart';
import '../../domain/repositories/profile_repository.dart';

import '../datasources/profile_local_datasource.dart';
import '../models/user_profile_model.dart';
import '../models/post_model.dart';
import '../models/reel_model.dart';
import '../models/tagged_post_model.dart';

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
}
