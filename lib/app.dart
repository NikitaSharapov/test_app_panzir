import 'package:flutter/material.dart';
import 'package:test_app/features/posts/posts_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: const Color.fromARGB(255, 3, 2, 100),
          ),
        ),
        home: const PostsScreen());
  }
}
