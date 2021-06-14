import 'package:flutter/material.dart';

class SignUpOtpScreen extends StatelessWidget {
  const SignUpOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/images/maintenance.png',
        ),
      ),
    );
  }
}
