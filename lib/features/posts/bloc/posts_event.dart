part of 'posts_bloc.dart';

sealed class PostsEvent {
  const PostsEvent();
}

final class PostsFetch extends PostsEvent {
  const PostsFetch();
}
