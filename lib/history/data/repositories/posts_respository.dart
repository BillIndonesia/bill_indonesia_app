import 'package:bill/history/data/models/post.dart';
import 'package:bill/history/data/services/posts_service.dart';

class PostsRepository {
  final PostsService service;

  PostsRepository(this.service);

  Future<List<Post>> fetchPosts(int page) async {
    final posts = await service.fetchPosts(page);
    return posts.map((e) => Post.fromJson(e)).toList();
  }

  Future<List<Post>> fetchHistory(int page) async {
    final posts = await service.fetchHistory(page);
    print(posts);
    return posts.map((e) => Post.fromJson(e)).toList();
  }
}
