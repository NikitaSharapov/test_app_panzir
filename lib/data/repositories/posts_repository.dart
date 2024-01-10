import 'package:test_app/data/http_client/http_client.dart';
import 'package:test_app/data/models/post.dart';

class PostsRepository {
  final HttpClient _httpClient;

  PostsRepository({required HttpClient httpClient}) : _httpClient = httpClient;
  
  Future<List<Post>> getPosts() async {
    return await _httpClient.getPosts();
  }
}
