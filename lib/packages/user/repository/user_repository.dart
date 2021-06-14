import 'dart:convert';

import '../data/user_data.dart';
import '../model/image_mock.dart';

class UserRepository {
  String image = ImageMockUp().image;

  Future<UserData> fetchUserInfo() async {
    var mockData = {
      "id": 73,
      "name": "Muhammad Vikral",
      "email": "Mvikral@gmail.com",
      "phone_number": "0812140048000",
      "saldo": 20000,
      "image": image,
    };
    await Future.delayed(
      Duration(
        seconds: 1,
      ),
    );
    var data = jsonEncode(mockData);

    try {
      Map<String, dynamic> responseData = jsonDecode(data);
      UserData userData = UserData.fromJson(responseData);
      return userData;
    } catch (e) {
      print(e);
      UserData userData = UserData.fromJson(data);
      return userData;
    }
  }
}
