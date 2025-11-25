import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetUserReels {
  final ProfileRepository repository;

  GetUserReels(this.repository);

  Future<List<Reel>> call() {
    return repository.getUserReels();
  }
}
