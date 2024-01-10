import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/app.dart';
import 'package:test_app/data/http_client/http_client.dart';
import 'package:test_app/data/repositories/comments_repository.dart';
import 'package:test_app/data/repositories/posts_repository.dart';
import 'package:test_app/features/posts/bloc/posts_bloc.dart';

void main() {
  runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HttpClient>(
          create: (context) => HttpClient(Dio()),
        ),
        RepositoryProvider<PostsRepository>(
          create: (context) =>
              PostsRepository(httpClient: context.read<HttpClient>()),
        ),
        RepositoryProvider<CommentsRepository>(
          create: (context) =>
              CommentsRepository(httpClient: context.read<HttpClient>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => PostsBloc(
                  postsRepository: context.read<PostsRepository>(),
                  commentsRepository: context.read<CommentsRepository>())
                ..add(const PostsFetch())),
        ],
        child: const App(),
      )));
}
