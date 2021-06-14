import 'package:flutter/material.dart';

class SigninPhoneNumberHeader extends StatelessWidget {
  final String header;
  const SigninPhoneNumberHeader({
    Key? key,
    required this.header,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: FittedBox(
        child: Text(
          'Masukan $header anda',
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
