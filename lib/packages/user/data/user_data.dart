class UserData {
  int id;
  String name;
  String email;
  String phoneNumber;
  int saldo;
  String image;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.saldo,
    required this.image,
  });

  factory UserData.fromJson(json) => UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        saldo: json['saldo'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['saldo'] = this.saldo;
    data['image'] = this.image;
    return data;
  }
}
