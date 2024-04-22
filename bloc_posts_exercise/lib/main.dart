import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts Exercise',

      home: BlocProvider(
        create: (context) => PostsBloc()..add(FetchPosts()),
        child: const PostsPage(),
      ),
    );
  }
}

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.greenAccent,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostsLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailsPage(post: post),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is PostsError) {
            return const Center(child: Text('Failed to load posts'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UserId: ${post.userId}',
              
            ),
            Text(
              'Id: ${post.id}',
              
            ),
            Text(
              'Title: ${post.title}',
              
            ),
            const SizedBox(height: 8),
            Text(
              'Body: ${post.body}',
              
            ),
            
          ],
        ),
      ),
    );
  }
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<FetchPosts>(_fetchPosts);
  }

  Future<void> _fetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      final posts = await _fetchPostsFromApi();
      emit(PostsLoaded(posts: posts));
    } catch (_) {
      emit(PostsError());
    }
  }

  Future<List<Post>> _fetchPostsFromApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonPosts = json.decode(response.body);
      return jsonPosts.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}


abstract class PostsEvent {}

class FetchPosts extends PostsEvent {}

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  PostsLoaded({required this.posts});
}

class PostsError extends PostsState {}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
