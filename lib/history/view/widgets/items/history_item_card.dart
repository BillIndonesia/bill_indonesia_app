import 'package:bill/history/data/models/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'history_item.dart';

class HistoryItemCard extends StatelessWidget {
  final Post post;
  HistoryItemCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _image = post.image;
    final String _name = post.name;
    final String type = post.type;
    final String _date =
        DateFormat('d MMMM y', 'en_US').format(DateTime.parse(post.date));
    final double _amount = post.amount;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.width * 0.04,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
        color: Color(
          0xFFF4F7F8,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HistoryItemPhoto(image: _image, name: _name),
          ...[
            HistoryItemNameAndDate(name: _name, date: _date),
            HistoryItemAmount(
              amount: _amount,
            ),
            _icon(type, context),
          ],
        ],
      ),
    );
  }

  Image _icon(String type, BuildContext context) {
    return Image(
      image: type == 'in'
          ? AssetImage('assets/images/plus.png')
          : AssetImage('assets/images/min.png'),
      width: MediaQuery.of(context).size.width * 0.08,
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
