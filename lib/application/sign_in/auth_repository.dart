import 'package:dio/dio.dart';

class AuthRepository {
  Future<bool> signinPhoneNumber(String _phoneNUmber) async {
    Dio _dio = Dio();
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill.co.id/',
      connectTimeout: 2000,
    ));
    Response response = await _dio.get('searchNotelp?notelp=$_phoneNUmber');
    print(response);
    if (response.toString() == 'Tidak') {
      return false;
    }
    return true;
  }

  Future<bool> signinPin(
    String _phoneNumber,
    String _pinNumber,
  ) async {
    Dio _dio = Dio();
    _dio.options = (BaseOptions(
      baseUrl: 'https://bill.co.id/',
      connectTimeout: 2000,
    ));
    Response response = await _dio.get(
      'apiflutter?username=$_phoneNumber&password=$_pinNumber',
    );
    print(response.statusCode);
    print(response);
    if (response.toString() == 'False') {
      return false;
    }
    return true;
  }

  Future<void> login() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 3));
    print('logged in');
    // throw Exception('failed log in');
  }
}
