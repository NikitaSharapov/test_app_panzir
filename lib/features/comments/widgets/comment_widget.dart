import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text('C')),
      title: Text(title),
      isThreeLine: true,
      subtitle: Text(text),
    );
  }
}
