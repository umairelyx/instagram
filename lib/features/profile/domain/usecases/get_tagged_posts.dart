import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetTaggedPosts {
  final ProfileRepository repository;

  GetTaggedPosts(this.repository);

  Future<List<TaggedPost>> call() {
    return repository.getTaggedPosts();
  }
}
