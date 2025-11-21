class Post {
  final String imageUrl;
  final bool isVideo;
  final bool isPinned;
  final double aspectRatio;

  const Post({
    required this.imageUrl,
    this.isVideo = false,
    this.isPinned = false,
    this.aspectRatio = 1.0,
  });
}
