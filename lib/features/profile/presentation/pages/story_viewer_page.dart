import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/entities.dart';

class StoryViewerPage extends StatefulWidget {
  final List<Story> stories;
  final String username;
  final String profileImage;

  const StoryViewerPage({
    super.key,
    required this.stories,
    required this.username,
    required this.profileImage,
  });

  @override
  State<StoryViewerPage> createState() => _StoryViewerPageState();
}

class _StoryViewerPageState extends State<StoryViewerPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _progressController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: AppDurations.storyDuration,
    );

    _startStory();
  }

  void _startStory() {
    _progressController.forward(from: 0);
    _timer = Timer(AppDurations.storyDuration, _nextStory);
  }

  void _nextStory() {
    if (_currentIndex < widget.stories.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _startStory();
    } else {
      Navigator.pop(context);
    }
  }

  void _previousStory() {
    if (_currentIndex > 0) {
      _timer?.cancel();
      _progressController.stop();
      setState(() {
        _currentIndex--;
      });
      _startStory();
    }
  }

  void _pauseStory() {
    _timer?.cancel();
    _progressController.stop();
  }

  void _resumeStory() {
    final remaining = _progressController.duration! *
        (1 - _progressController.value);
    _progressController.forward();
    _timer = Timer(remaining, _nextStory);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GestureDetector(
        onTapDown: (details) {
          final width = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx < width / 2) {
            _previousStory();
          } else {
            _nextStory();
          }
        },
        onLongPressStart: (_) => _pauseStory(),
        onLongPressEnd: (_) => _resumeStory(),
        child: Stack(
          children: [
            // Story Image
            Center(
              child: Image.asset(
                widget.stories[_currentIndex].imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            // Top gradient overlay
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: AppDimensions.storyHeaderHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.storyOverlay,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Progress bars
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingSmall,
                      vertical: AppDimensions.spacingSmall,
                    ),
                    child: Row(
                      children: List.generate(
                        widget.stories.length,
                        (index) => Expanded(
                          child: Container(
                            height: AppDimensions.storyProgressHeight,
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.storyProgressSpacing,
                            ),
                            child: AnimatedBuilder(
                              animation: _progressController,
                              builder: (context, child) {
                                return LinearProgressIndicator(
                                  value: index == _currentIndex
                                      ? _progressController.value
                                      : index < _currentIndex
                                          ? 1.0
                                          : 0.0,
                                  backgroundColor:
                                      AppColors.storyProgressInactive,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                    AppColors.storyProgressActive,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingMedium,
                      vertical: AppDimensions.spacingSmall,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: AppDimensions.profilePictureSmall,
                          height: AppDimensions.profilePictureSmall,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.textPrimary,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(widget.profileImage),
                          ),
                        ),
                        const SizedBox(width: AppDimensions.spacingSmall),
                        Text(
                          widget.username,
                          style: AppTextStyles.storyUsername,
                        ),
                        const SizedBox(width: AppDimensions.spacingSmall),
                        Text(
                          _getTimeAgo(),
                          style: AppTextStyles.storyTimestamp,
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: AppColors.textPrimary,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.textPrimary,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom interaction area
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.spacingLarge),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.spacingLarge,
                            vertical: AppDimensions.spacingMedium,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.storyProgressInactive,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusLarge,
                            ),
                          ),
                          child: const Text(
                            'Send message',
                            style: AppTextStyles.storyAction,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppDimensions.spacingMedium),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border,
                          color: AppColors.textPrimary,
                          size: AppDimensions.iconLarge,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: AppColors.textPrimary,
                          size: AppDimensions.iconLarge,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo() {
    if (widget.stories.isEmpty) return '';
    
    final story = widget.stories[_currentIndex];
    final difference = DateTime.now().difference(story.timestamp);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
}
