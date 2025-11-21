import 'package:flutter/material.dart';

class PostDetailPage extends StatefulWidget {
  final String imageUrl;
  final int postIndex;

  const PostDetailPage({
    super.key,
    required this.imageUrl,
    required this.postIndex,
  });

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Posts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Header
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
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
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey.shade800,
                        backgroundImage: const AssetImage(
                          'assets/images/profile/user.png',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'google',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          // SizedBox(width: 4),
                          // Text(
                          //   'and',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 14,
                          //   ),
                          // ),
                          // SizedBox(width: 4),
                          // Text(
                          //   'googlegemini',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 14,
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.music_note, color: Colors.white, size: 12),
                          SizedBox(width: 4),
                          Text(
                            'googlegemini • Original audio',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Post Image with page indicator
            Stack(
              children: [
                Image.asset(
                  widget.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 400,
                      color: Colors.grey.shade900,
                      child: Center(
                        child: Icon(
                          Icons.image,
                          color: Colors.grey.shade700,
                          size: 80,
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      '1/10',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.volume_up,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 26),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Likes Count
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '8,741 likes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            // Caption
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'googlegemini ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text:
                          'Texting, texting, 1 2 3. Nano Banana Pro has state-of-the-art text rendering for... ',
                    ),
                    TextSpan(
                      text: 'more',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            // View Comments
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                'View all 156 comments',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
              ),
            ),

            // Time
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                '2 days ago',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
