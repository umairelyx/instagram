import 'package:equatable/equatable.dart';
import '../../domain/entities/entities.dart';

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
  final List<Story> stories;

  const ProfileLoaded({
    required this.profile,
    required this.posts,
    required this.reels,
    required this.tagged,
    required this.stories,
  });

  @override
  List<Object?> get props => [profile, posts, reels, tagged, stories];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
