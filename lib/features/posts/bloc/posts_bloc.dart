import 'package:bloc/bloc.dart';
import 'package:test_app/data/models/post.dart';
import 'package:test_app/data/repositories/comments_repository.dart';
import 'package:test_app/data/repositories/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsRepository _postsRepository;
  final CommentsRepository _commentsRepository;

  PostsBloc(
      {required PostsRepository postsRepository,
      required CommentsRepository commentsRepository})
      : _postsRepository = postsRepository,
        _commentsRepository = commentsRepository,
        super(const PostsInitial()) {
    on<PostsFetch>((event, emit) => _getPosts(emit: emit));
  }

  _getPosts({required Emitter<PostsState> emit}) async {
    try {
      emit(const PostsFetching(message: 'Posts loading'));
      final posts = await _postsRepository.getPosts();
      final postsWithComments = await Future.wait(posts.map((post) async {
        final comments =
            await _commentsRepository.getCommentsByPostId(postId: post.id);
        return PostWithComments(
            comments: comments,
            id: post.id,
            userId: post.userId,
            title: post.title,
            body: post.body);
      }).toList());

      emit(PostsFetched(posts: postsWithComments));
    } catch (e) {
      emit(const PostsError(message: 'Posts receiving error'));
    }
  }
}
