import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SigninProvider with ChangeNotifier {
  String? phoneNUmber;
  String? pin;
  bool? isError;
  SigninProvider({
    this.phoneNUmber,
    this.pin,
    this.isError,
  });
  void phoneNumberInput(String _phoneNUmber) {
    phoneNUmber = _phoneNUmber;
    notifyListeners();
  }

  Future<bool> signinPhoneNumber(String _phoneNUmber) async {
    Dio _dio = Dio();
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill.co.id/',
      connectTimeout: 2000,
    ));
    bool _state = false;
    Response response = await _dio.get('searchNotelp?notelp=$_phoneNUmber');
    print(response);
    return _state;
  }
}
