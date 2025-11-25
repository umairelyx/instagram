import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetUserPosts {
  final ProfileRepository repository;

  GetUserPosts(this.repository);

  Future<List<Post>> call() {
    return repository.getUserPosts();
  }
}
