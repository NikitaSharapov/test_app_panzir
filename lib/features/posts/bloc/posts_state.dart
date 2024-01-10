

part of 'posts_bloc.dart';

sealed class PostsState {
  const PostsState();
}

final class PostsInitial extends PostsState {
  const PostsInitial();
}

final class PostsFetching extends PostsState {
  final String message;
  const PostsFetching({required this.message});
}

final class PostsFetched extends PostsState {
  final List<PostWithComments> posts;
  const PostsFetched({required this.posts});
}

final class PostsError extends PostsState {
  final String message;
  const PostsError({required this.message});
}
