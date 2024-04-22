// main.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostListPage(),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId,  required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];
  Post? _selectedPost;

  List<Post> get posts => _posts;
  Post? get selectedPost => _selectedPost;

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      _posts = (json.decode(response.body) as List).map((post) => Post.fromJson(post)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void selectPost(Post post) {
    _selectedPost = post;
    notifyListeners();
  }
}

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.lightBlue,
      ),
      body: FutureBuilder(
        future: Provider.of<PostProvider>(context, listen: false).fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<PostProvider>(
              builder: (context, postProvider, child) {
                return ListView.builder(
                  itemCount: postProvider.posts.length,
                  itemBuilder: (context, index) {
                    final post = postProvider.posts[index];
                    return ListTile(
                      title: Text(post.title),
                      onTap: () {
                        postProvider.selectPost(post);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PostDetailPage(),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final selectedPost = postProvider.selectedPost;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPost?.title ?? 'Post Details'),
        backgroundColor: Colors.greenAccent,
      ),
      body: selectedPost != null ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(selectedPost.title, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(selectedPost.body),
          ],
        ),
      ) : const Center(child: Text('No post selected')),
    );
  }
}