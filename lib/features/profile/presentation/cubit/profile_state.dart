import 'package:equatable/equatable.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/reel.dart';
import '../../domain/entities/tagged_post.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfile profile;
  final List<Post> posts;
  final List<Reel> reels;
  final List<TaggedPost> tagged;

  const ProfileLoaded({
    required this.profile,
    required this.posts,
    required this.reels,
    required this.tagged,
  });

  @override
  List<Object?> get props => [profile, posts, reels, tagged];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
