import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'post_repository.dart';

final postRepositoryProvider = Provider((ref) => PostRepository());
final postsProvider = FutureProvider((ref) async {
  final postRepository = ref.watch(postRepositoryProvider);
  return postRepository.fetchPosts();
});
final selectedPostProvider = StateProvider<Post?>((ref) => null);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
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

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncValue = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Colors.lightBlue,
      ),
      body: postsAsyncValue.when(
        data: (posts) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                onTap: () {
                  ref.read(selectedPostProvider.notifier).state = post;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>const PostDetailPage(),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class PostDetailPage extends ConsumerWidget {
  const PostDetailPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPost = ref.watch(selectedPostProvider);
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text(selectedPost?.title ?? 'Post Details'),
        backgroundColor: Colors.greenAccent,
      ),
      body: selectedPost != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(selectedPost.title, style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 20),
                  Text(selectedPost.body),
                ],
              ),
            )
          : const Center(child: Text('No post selected')),
    );
  }
}