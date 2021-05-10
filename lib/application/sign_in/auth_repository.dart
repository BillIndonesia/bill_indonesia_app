class AuthRepository {
  Future<void> login() async {
    print('attempting login');
    await Future.delayed(Duration(seconds: 1));
    print('logged in');
    throw Exception('failed log in');
  }
}
