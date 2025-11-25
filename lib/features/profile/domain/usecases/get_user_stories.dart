import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetUserStories {
  final ProfileRepository repository;

  GetUserStories(this.repository);

  Future<List<Story>> call() {
    return repository.getUserStories();
  }
}
