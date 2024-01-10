import 'package:flutter/material.dart';
import 'package:test_app/features/comments/widgets/comment_widget.dart';
import 'package:test_app/data/models/comment.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key, required this.comments});
  final List<Comment> comments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).cardTheme.surfaceTintColor,
            title: const Text(
              'Comments',
            )),
        body: ListView.separated(
          itemCount: comments.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            height: 10,
          ),
          shrinkWrap: true,
          itemBuilder: (context, index) => CommentWidget(
            title: comments[index].name,
            text: comments[index].body,
          ),
        ));
  }
}
