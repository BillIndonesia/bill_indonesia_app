import 'package:bill/data/model/auth/auth_model.dart';

class AuthRepository {
  Future<AuthModel> getIsUserRegistered(String _phoneNumber) async {
    //jsonseriliazed _phoneNumber
    //getDataFrom auth_api
    //jsondeseriliazied phoneNUmber to into AuthModel
    //return AuthModel
    return AuthModel(phoneNumber: '05');
  }
}
