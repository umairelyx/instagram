library profile;

/// Barrel file for profile feature
/// 
/// This file exports all layers of the profile feature following Clean Architecture.
/// 
/// Layers:
/// - Domain: Business logic (entities, repositories, use cases)
/// - Data: Data management (models, data sources, repository implementations)
/// - Presentation: UI (pages, widgets, state management)
/// 
/// Usage:
/// ```dart
/// import 'package:instagram/features/profile/profile.dart';
/// 
/// // Access all profile feature components
/// ```

export 'domain/domain.dart';
export 'data/data.dart';
export 'presentation/presentation.dart';
