import '../../domain/entities/entities.dart';

class ReelModel extends Reel {
  const ReelModel({
    required super.videoUrl,
    required super.thumbnailUrl,
    required super.viewCount,
    super.isVideo = true,
  });

  factory ReelModel.fromMap(Map<String, dynamic> map) {
    return ReelModel(
      videoUrl: map['videoUrl'] ?? '',
      thumbnailUrl: map['thumbnailUrl'] ?? '',
      viewCount: map['viewCount']?.toInt() ?? 0,
      isVideo: map['isVideo'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoUrl': videoUrl,
      'thumbnailUrl': thumbnailUrl,
      'viewCount': viewCount,
      'isVideo': isVideo,
    };
  }
}
