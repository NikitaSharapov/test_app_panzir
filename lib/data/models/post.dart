import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/data/models/comment.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  final int id;
  final int userId;
  final String title;
  final String body;

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable()
class PostWithComments extends Post {
  const PostWithComments(
      {required this.comments,
      required super.id,
      required super.userId,
      required super.title,
      required super.body});

  factory PostWithComments.fromJson(Map<String, dynamic> json) =>
      _$PostWithCommentsFromJson(json);

  final List<Comment> comments;

  @override
  Map<String, dynamic> toJson() => _$PostWithCommentsToJson(this);
}
