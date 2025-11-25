import 'package:get_it/get_it.dart';
import '../../features/profile/data/datasources/profile_local_datasource.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/usecases/get_user_profile.dart';
import '../../features/profile/domain/usecases/get_user_posts.dart';
import '../../features/profile/domain/usecases/get_user_reels.dart';
import '../../features/profile/domain/usecases/get_tagged_posts.dart';
import '../../features/profile/domain/usecases/get_user_stories.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Profile
  
  // Cubit
  sl.registerFactory(
    () => ProfileCubit(
      getUserProfile: sl(),
      getUserPosts: sl(),
      getUserReels: sl(),
      getTaggedPosts: sl(),
      getUserStories: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUserProfile(sl()));
  sl.registerLazySingleton(() => GetUserPosts(sl()));
  sl.registerLazySingleton(() => GetUserReels(sl()));
  sl.registerLazySingleton(() => GetTaggedPosts(sl()));
  sl.registerLazySingleton(() => GetUserStories(sl()));

  // Repository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(),
  );
}
