import 'package:test_app/data/http_client/http_client.dart';
import 'package:test_app/data/models/comment.dart';

class CommentsRepository {
  final HttpClient _httpClient;

  CommentsRepository({required HttpClient httpClient})
      : _httpClient = httpClient;

  Future<List<Comment>> getCommentsByPostId({required int postId}) async {
    return await _httpClient.getCommentsByPostId(postId);
  }
}
