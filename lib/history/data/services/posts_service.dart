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

  Future<List<dynamic>> fetchHistory({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nohp = prefs.getString('nohp');
    var url = Uri.parse(
        'https://bill-indonesia.com/api/transaction/transaction-history/?customer__phone_number=$nohp&page=$page');
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

  Future<List<dynamic>> fetchFilteredHistory({
    required int page,
    required String startDate,
    required String endDate,
    required bool topup,
    required bool payment,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nohp = prefs.getString('nohp');
    bool findToupUp = topup == true && payment == false;
    bool findpayment = payment == true && topup == false;
    String paymentType = findToupUp
        ? '1'
        : findpayment
            ? '2'
            : '';
    print('payment type is : $paymentType');
    var url = Uri.parse(
        'https://bill-indonesia.com/api/transaction/transaction-history/?customer__phone_number=$nohp&page=$page&start_date=$startDate&end_date=$endDate&transaction_type=$paymentType');
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
