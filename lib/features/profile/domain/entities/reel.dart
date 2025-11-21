class Reel {
  final String videoUrl;
  final String thumbnailUrl;
  final int viewCount;
  final bool isVideo;

  const Reel({
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.viewCount,
    this.isVideo = true,
  });
}
