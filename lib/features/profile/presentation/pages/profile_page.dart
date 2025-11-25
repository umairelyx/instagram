import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart' as di;
import '../../domain/entities/entities.dart';
import '../cubit/cubit.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ProfileCubit>()..loadProfile(),
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
