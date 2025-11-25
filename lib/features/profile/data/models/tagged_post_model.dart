import '../../domain/entities/entities.dart';

class TaggedPostModel extends TaggedPost {
  const TaggedPostModel({
    required super.imageUrl,
    required super.taggedUsername,
  });

  factory TaggedPostModel.fromMap(Map<String, dynamic> map) {
    return TaggedPostModel(
      imageUrl: map['imageUrl'] ?? '',
      taggedUsername: map['taggedUsername'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'taggedUsername': taggedUsername,
    };
  }
}
