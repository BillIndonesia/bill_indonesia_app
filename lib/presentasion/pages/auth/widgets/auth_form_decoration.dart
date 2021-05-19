import 'package:flutter/material.dart';

class AuthFormDecoration {
  InputDecoration signinPhoneNumberFormDecoration() {
    return InputDecoration(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF93CCDA),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF93CCDA),
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 3.0,
        ),
      ),
      hintText: 'Nomor  Telepon',
      hintStyle: TextStyle(
        color: Color(0xFF93CCDA),
        fontSize: 28.0,
        fontFamily: 'Montserrat',
      ),
    );
  }
}
