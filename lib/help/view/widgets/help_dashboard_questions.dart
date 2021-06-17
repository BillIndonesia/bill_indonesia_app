import 'package:bill/help/model/bantuan_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BantuanDashoardQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final description = Provider.of<BantuanModelItem>(context);
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF4F7F8),
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.08,
      ),
      height: MediaQuery.of(context).size.height * 0.09,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text(
              description.question,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                color: Color(0xFF5A5B5C),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
            child: FittedBox(
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xFF6C6565),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
