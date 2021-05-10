import 'package:flutter/material.dart';

class AuthButtonStyle extends StatelessWidget {
  final String title;
  const AuthButtonStyle({
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.5,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        color: Color(0xFF0A9ABC),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: FittedBox(
            child: Text(
              title,
              style: TextStyle(
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
