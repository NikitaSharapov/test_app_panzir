// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      email: json['email'] as String,
      id: json['id'] as int,
      postId: json['postId'] as int,
      name: json['name'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'name': instance.name,
      'body': instance.body,
      'email': instance.email,
    };
