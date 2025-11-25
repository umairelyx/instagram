import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetUserProfile {
  final ProfileRepository repository;

  GetUserProfile(this.repository);

  Future<UserProfile> call() {
    return repository.getUserProfile();
  }
}
