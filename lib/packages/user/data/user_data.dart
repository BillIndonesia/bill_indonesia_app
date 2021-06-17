import 'package:bill/packages/user/model/image_mock.dart';

class UserData {
  String name;
  String email;
  String phoneNumber;
  double saldo;
  String image;

  UserData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.saldo,
    required this.image,
  });

  factory UserData.fromJson(json) => UserData(
        name: json['customer_name'],
        email: json['customer_email'] ?? 'example@bill.co.id',
        phoneNumber: json['phone_number'],
        saldo: json['customer_balance'],
        image: ImageMockUp().image,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['saldo'] = this.saldo;
    data['image'] = this.image;
    return data;
  }
}
