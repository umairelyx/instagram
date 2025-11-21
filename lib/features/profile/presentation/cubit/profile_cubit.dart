import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/profile/domain/usecases/get_user_posts.dart';
import 'package:instagram/features/profile/domain/usecases/get_user_profile.dart';
import 'package:instagram/features/profile/domain/usecases/get_user_reels.dart';
import 'package:instagram/features/profile/domain/usecases/get_tagged_posts.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfile getUserProfile;
  final GetUserPosts getUserPosts;
  final GetUserReels getUserReels;
  final GetTaggedPosts getTaggedPosts;

  ProfileCubit({
    required this.getUserProfile,
    required this.getUserPosts,
    required this.getUserReels,
    required this.getTaggedPosts,
  }) : super(ProfileInitial());

  Future<void> loadProfile() async {
    emit(ProfileLoading());

    try {
      final profile = await getUserProfile();
      final posts = await getUserPosts();
      final reels = await getUserReels();
      final tagged = await getTaggedPosts();

      emit(ProfileLoaded(
        profile: profile,
        posts: posts,
        reels: reels,
        tagged: tagged,
      ));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
