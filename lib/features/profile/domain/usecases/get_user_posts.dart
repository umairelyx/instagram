import '../entities/post.dart';
import '../repositories/profile_repository.dart';

class GetUserPosts {
  final ProfileRepository repository;

  GetUserPosts(this.repository);

  Future<List<Post>> call() {
    return repository.getUserPosts();
  }
}
