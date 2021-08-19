import 'package:bill/history/data/models/post.dart';
import 'package:bill/history/data/services/posts_service.dart';

class PostsRepository {
  final PostsService service;

  PostsRepository(this.service);

  Future<List<Post>> fetchPosts(int page) async {
    final posts = await service.fetchPosts(page);
    return posts.map((e) => Post.fromJson(e)).toList();
  }

  Future<List<Post>> fetchHistory({required int page}) async {
    final posts = await service.fetchHistory(page: page);
    return posts.map((e) => Post.fromJson(e)).toList();
  }

  Future<List<Post>> fetchFilteredHistory({
    required int page,
    required String startDate,
    required String endDate,
    required bool topup,
    required bool payment,
  }) async {
    final posts = await service.fetchFilteredHistory(
      page: page,
      startDate: startDate,
      endDate: endDate,
      topup: topup,
      payment: payment,
    );
    return posts.map((e) => Post.fromJson(e)).toList();
  }
}
