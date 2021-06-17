import 'dart:convert';

import 'package:http/http.dart';

class PostsService {
  static const FETCH_LIMIT = 15;
  final baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<dynamic>> fetchPosts(int page) async {
    try {
      final response =
          await get(Uri.parse(baseUrl + "?_limit=$FETCH_LIMIT&_page=$page"));
      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      return [];
    }
  }

  Future<List<dynamic>> fetchHistory(int page) async {
    var url = Uri.parse('https://bill.co.id/riwayatBeta');
    try {
      final response = await post(
        url,
        body: {
          'username': '0812140048000',
          'password': '111111',
          'page': page.toString(),
        },
      );

      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      print(err);
      return [];
    }
  }
}
