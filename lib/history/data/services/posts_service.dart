import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nohp = prefs.getString('nohp');
    var url = Uri.parse(
        'https://dev.bill-indonesia.com/api/transaction/transaction-history/?customer__phone_number=$nohp&page=$page');
    try {
      final response = await get(
        url,
      );

      return jsonDecode(response.body) as List<dynamic>;
    } catch (err) {
      print(err);
      return [];
    }
  }
}
