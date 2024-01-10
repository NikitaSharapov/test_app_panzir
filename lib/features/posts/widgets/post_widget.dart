import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:test_app/data/models/comment.dart';
import 'package:test_app/features/comments/comments_screen.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.badgeCount,
    required this.title,
    required this.text,
    required this.comments,
  });
  final int badgeCount;
  final String title;
  final String text;
  final List<Comment> comments;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: -6, end: -1),
        badgeContent: Text(badgeCount.toString(),
            style: const TextStyle(color: Colors.white)),
        showBadge: badgeCount == 0 ? false : true,
        child: Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CommentsScreen(comments: comments),
                ),
              );
            },
            child: ListTile(
              title: Text(title),
              subtitle: Text(text),
            ),
          ),
        ),
      ),
    );
  }
}
