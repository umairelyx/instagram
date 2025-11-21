import '../entities/tagged_post.dart';
import '../repositories/profile_repository.dart';

class GetTaggedPosts {
  final ProfileRepository repository;

  GetTaggedPosts(this.repository);

  Future<List<TaggedPost>> call() {
    return repository.getTaggedPosts();
  }
}
