class Post {
  final String name;
  final double amount;
  final String type;
  final String image;
  final String date;

  Post.fromJson(Map json)
      : name = json['name'],
        amount = json['amount'],
        type = json['transfer_type'],
        image = json['image'],
        date = json['payment_date'];
}
