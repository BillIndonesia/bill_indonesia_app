import 'package:flutter/material.dart';

class HistoryItemNameAndDate extends StatelessWidget {
  const HistoryItemNameAndDate({
    Key? key,
    required String name,
    required String date,
  })  : _name = name,
        _date = date,
        super(key: key);

  final String _name;
  final String _date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            _name.split(" ")[0],
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(
                0xFF6C6565,
              ),
            ),
          ),
        ),
        Container(
          child: Text(
            _date,
            style: TextStyle(
              color: Color(0xFF999494),
              fontWeight: FontWeight.normal,
              fontSize: 13.0,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ],
    );
  }
}
