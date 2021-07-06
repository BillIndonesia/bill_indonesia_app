import 'package:bill/home_page/view/home_screen.dart';

import 'package:flutter/material.dart';

class InputPaymentScreen extends StatelessWidget {
  const InputPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String _destinationName = 'Test Angkot';
    // Uint8List bytes = base64.decode(_destinationImage);

    ErrorWidget.builder = (FlutterErrorDetails details) =>
        Scaffold(backgroundColor: Colors.white);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Container(
          width: MediaQuery.of(context).size.width * 0.43,
          child: FittedBox(
            child: Text(
              'Pembayaran Angkot',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(
                  0xFF423838,
                ),
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF777E81), size: 30),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => new HomePage(),
              ),
            );
          },
        ),
        backgroundColor: Color(0xFFF4F7F8),
        elevation: 0.0,
      ),
    );
  }
}
