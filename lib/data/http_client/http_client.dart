import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:test_app/data/models/comment.dart';
import 'package:test_app/data/models/post.dart';

part 'http_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class HttpClient {
  factory HttpClient(Dio dio, {String baseUrl}) = _HttpClient;

  @GET('/posts?_start=0&_limit=10')
  Future<List<Post>> getPosts();

  @GET('/posts/{id}/comments')
  Future<List<Comment>> getCommentsByPostId(@Path() int id);
}
