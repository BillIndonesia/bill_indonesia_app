class UserData {
  int id;
  String name;
  String email;
  String phoneNumber;
  double saldo;
  String image;
  String bornplace;
  String bornDate;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.saldo,
    required this.image,
    required this.bornplace,
    required this.bornDate,
  });

  factory UserData.fromJson(json) => UserData(
        id: json['customer_id'],
        name: json['customer_name'],
        email: json['customer_email'] ?? 'example@bill.co.id',
        phoneNumber: json['phone_number'],
        saldo: json['balance'],
        image: json['customer_image'] ?? '',
        bornplace: json['customer_bornplace'] ?? '',
        bornDate: json['customer_borndate'] ?? '',
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
