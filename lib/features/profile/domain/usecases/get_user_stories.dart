import '../entities/story.dart';
import '../repositories/profile_repository.dart';

class GetUserStories {
  final ProfileRepository repository;

  GetUserStories(this.repository);

  Future<List<Story>> call() {
    return repository.getUserStories();
  }
}
