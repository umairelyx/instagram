import '../entities/reel.dart';
import '../repositories/profile_repository.dart';

class GetUserReels {
  final ProfileRepository repository;

  GetUserReels(this.repository);

  Future<List<Reel>> call() {
    return repository.getUserReels();
  }
}
