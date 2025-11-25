import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/profile/domain/usecases/get_user_posts.dart';
import 'package:instagram/features/profile/domain/usecases/get_user_profile.dart';
import 'package:instagram/features/profile/domain/usecases/get_user_reels.dart';
import 'package:instagram/features/profile/domain/usecases/get_tagged_posts.dart';
import 'package:instagram/features/profile/domain/usecases/get_user_stories.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfile getUserProfile;
  final GetUserPosts getUserPosts;
  final GetUserReels getUserReels;
  final GetTaggedPosts getTaggedPosts;
  final GetUserStories getUserStories;

  ProfileCubit({
    required this.getUserProfile,
    required this.getUserPosts,
    required this.getUserReels,
    required this.getTaggedPosts,
    required this.getUserStories,
  }) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      final profile = await getUserProfile();
      final posts = await getUserPosts();
      final reels = await getUserReels();
      final tagged = await getTaggedPosts();
      final stories = await getUserStories();

      emit(ProfileLoaded(
        profile: profile,
        posts: posts,
        reels: reels,
        tagged: tagged,
        stories: stories,
      ));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
