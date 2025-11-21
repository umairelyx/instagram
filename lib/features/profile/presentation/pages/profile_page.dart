import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_user_posts.dart';
import '../../domain/usecases/get_user_profile.dart';
import '../../domain/usecases/get_user_reels.dart';
import '../../domain/usecases/get_tagged_posts.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/reel.dart';
import '../../domain/entities/tagged_post.dart';

import '../../presentation/cubit/profile_cubit.dart';
import '../../presentation/cubit/profile_state.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_stats.dart';
import '../widgets/profile_bio.dart';
import '../widgets/profile_actions.dart';
import '../widgets/profile_tabs.dart';
import '../widgets/profile_posts_grid.dart';
import '../widgets/profile_reels_grid.dart';
import '../widgets/profile_tagged_grid.dart';
import '../widgets/bottom_navigation.dart';

import '../../../profile/data/datasources/profile_local_datasource.dart';
import '../../../profile/data/repositories/profile_repository_impl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();

    /// Dependency Injection (manual for now)
    final dataSource = ProfileLocalDataSourceImpl();
    final repository = ProfileRepositoryImpl(localDataSource: dataSource);

    cubit = ProfileCubit(
      getUserProfile: GetUserProfile(repository),
      getUserPosts: GetUserPosts(repository),
      getUserReels: GetUserReels(repository),
      getTaggedPosts: GetTaggedPosts(repository),
    );

    cubit.loadProfile(); // load data at start
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cubit,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading || state is ProfileInitial) {
              return const SafeArea(
                child: Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              );
            }

            if (state is ProfileError) {
              return SafeArea(
                child: Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }

            if (state is ProfileLoaded) {
              final UserProfile p = state.profile;
              final List<Post> posts = state.posts;
              final List<Reel> reels = state.reels;
              final List<TaggedPost> tagged = state.tagged;

              return SafeArea(
                child: DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              ProfileHeader(
                                username: p.username,
                                isVerified: p.isVerified,
                              ),
                              ProfileStats(
                                posts: p.postsCount,
                                followers: p.followersCount,
                                following: p.followingCount,
                                profileImage: p.profileImageUrl,
                              ),
                              ProfileBio(
                                category: p.category,
                                bio: p.bio,
                                link: p.link,
                              ),
                              const ProfileActions(),
                              const ProfileTabs(),
                            ],
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                      children: [
                        // Posts Tab
                        SingleChildScrollView(
                          child: ProfilePostsGrid(
                            posts: posts.map((e) => e.imageUrl).toList(),
                          ),
                        ),
                        // Reels Tab
                        SingleChildScrollView(
                          child: ProfileReelsGrid(
                            reels: reels.map((e) => e.thumbnailUrl).toList(),
                            videoUrls: reels.map((e) => e.videoUrl).toList(),
                          ),
                        ),
                        // Tagged Tab
                        SingleChildScrollView(
                          child: ProfileTaggedGrid(
                            tagged: tagged.map((e) => e.imageUrl).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return const SizedBox();
          },
        ),
        bottomNavigationBar: const InstagramBottomNavigation(),
      ),
    );
  }
}
