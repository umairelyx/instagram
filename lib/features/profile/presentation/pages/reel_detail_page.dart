import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelDetailPage extends StatefulWidget {
  final String videoUrl;
  final int reelIndex;

  const ReelDetailPage({
    super.key,
    required this.videoUrl,
    required this.reelIndex,
  });

  @override
  State<ReelDetailPage> createState() => _ReelDetailPageState();
}

class _ReelDetailPageState extends State<ReelDetailPage> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;
  bool isLiked = false;
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset(widget.videoUrl);
      await _controller.initialize();
      setState(() {
        _isInitialized = true;
      });
      _controller.setLooping(true);
      _controller.play();
    } catch (e) {
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video Player
          Center(
            child: _hasError
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Error loading video',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.videoUrl,
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : _isInitialized
                    ? GestureDetector(
                        onTap: _togglePlayPause,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : const CircularProgressIndicator(color: Colors.white),
          ),

          // Top Bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          // Right Side Actions
          Positioned(
            right: 16,
            bottom: 100,
            child: Column(
              children: [
                // Like Button
                Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.white,
                        size: 32,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                    Text(
                      '${(widget.reelIndex + 1) * 523}K',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Comment Button
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () {},
                    ),
                    const Text(
                      '156',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Share Button
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 32,
                      ),
                      onPressed: () {},
                    ),
                    const Text(
                      '3,002',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Save Button
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      isSaved = !isSaved;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // More Options
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Bottom Info
          Positioned(
            left: 16,
            right: 80,
            bottom: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.orange, Colors.pink],
                        ),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage('assets/images/profile/user.png'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'google',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Caption
                const Text(
                  'Going bananas 🍌 Check out our latest innovation!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // Audio
                Row(
                  children: [
                    const Icon(Icons.music_note, color: Colors.white, size: 14),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Original audio - google',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Play/Pause Indicator
          if (_isInitialized)
            Center(
              child: AnimatedOpacity(
                opacity: _controller.value.isPlaying ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
