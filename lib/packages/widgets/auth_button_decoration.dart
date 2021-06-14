import 'package:flutter/material.dart';

class AuthButtonDecoration extends StatelessWidget {
  final String title;
  // ignore: sort_constructors_first
  const AuthButtonDecoration({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Card(
        color: const Color(0xFF0A9ABC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: FittedBox(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
