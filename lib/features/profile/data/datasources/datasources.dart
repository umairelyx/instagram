library profile_datasources;

/// Barrel file for profile data sources
/// 
/// This file exports all data sources for the profile feature.
/// Data sources handle data fetching from local or remote sources.
/// 
/// Usage:
/// ```dart
/// import 'package:instagram/features/profile/data/datasources/datasources.dart';
/// 
/// // Now you can use:
/// ProfileLocalDataSource localDataSource;
/// ProfileLocalDataSourceImpl localDataSourceImpl;
/// ```

export 'profile_local_datasource.dart';
