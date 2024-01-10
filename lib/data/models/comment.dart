import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  const Comment({
    required this.email,
    required this.id,
    required this.postId,
    required this.name,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  final int id;
  final int postId;
  final String name;
  final String body;
  final String email;

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
