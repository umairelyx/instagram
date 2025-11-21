import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  Widget _storyHighlight(String label, {bool hasStory = false}) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: hasStory ? Colors.grey.shade700 : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Center(
            child: Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade900,
              ),
              child: Icon(
                Icons.image_outlined,
                color: Colors.grey.shade700,
                size: 28,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade300,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Story Highlights
        Container(
          height: 110,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _storyHighlight("Nano Banana Pro", hasStory: true),
              const SizedBox(width: 16),
              _storyHighlight("Gemini 3", hasStory: true),
              const SizedBox(width: 16),
              _storyHighlight("AI Mode", hasStory: true),
              const SizedBox(width: 16),
              _storyHighlight("More", hasStory: true),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Tabs
        const TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 1,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(icon: Icon(Icons.grid_on_outlined, size: 24)),
            Tab(icon: Icon(Icons.video_collection_outlined, size: 24)),
            Tab(icon: Icon(Icons.person_pin_outlined, size: 24)),
          ],
        ),
      ],
    );
  }
}
