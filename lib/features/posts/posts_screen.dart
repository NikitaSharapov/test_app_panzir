import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/posts/bloc/posts_bloc.dart';
import 'package:test_app/features/posts/widgets/post_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).cardTheme.surfaceTintColor,
            title: const Text(
              'Posts',
            )),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsFetching) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message),
                      const SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator(),
                    ]),
              );
            }
            if (state is PostsFetched) {
              return ListView.separated(
                itemCount: state.posts.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) => PostWidget(
                  comments: state.posts[index].comments,
                  badgeCount: state.posts[index].comments.length,
                  title: state.posts[index].title,
                  text: state.posts[index].body,
                ),
              );
            }
            if (state is PostsError) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<PostsBloc>().add(const PostsFetch());
                          },
                          child: const Text('Repeat'))
                    ]),
              );
            }
            return const Center();
          },
        ));
  }
}
