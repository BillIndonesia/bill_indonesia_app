class Post {
  final String name;
  final double amount;
  final String type;
  final String image;
  final String date;

  Post.fromJson(Map json)
      : name = json['merchant'] != null
            ? json['merchant']['merchant_name']
            : "Voucher",
        image =
            json['merchant'] != null ? json['merchant']['merchant_image'] : "",
        type = json['transaction']['transaction_type'],
        amount = json['transaction']['amount'],
        date = json['transaction']['create_date'];
}
