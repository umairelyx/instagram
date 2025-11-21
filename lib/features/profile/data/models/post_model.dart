import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.imageUrl,
    super.isVideo = false,
    super.isPinned = false,
    super.aspectRatio = 1.0,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      imageUrl: map['imageUrl'] ?? '',
      isVideo: map['isVideo'] ?? false,
      isPinned: map['isPinned'] ?? false,
      aspectRatio: (map['aspectRatio'] ?? 1.0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'isVideo': isVideo,
      'isPinned': isPinned,
      'aspectRatio': aspectRatio,
    };
  }
}
