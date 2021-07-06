import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class PaymentResultDestinationProfile extends StatelessWidget {
  const PaymentResultDestinationProfile({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64.decode(image);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            //Decorasi Image
            decoration: image != ''
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: MemoryImage(bytes),
                    ),
                  )
                : BoxDecoration(shape: BoxShape.circle),
            //Bolean Image
            child: image == ''
                ? CircleAvatar(
                    backgroundColor: Color(0xFF0485AC),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: FittedBox(
                        child: Text(
                          'B 1234 VW'[0],
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFFF4F7F8),
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          // Nama Penerima
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.03,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                'B 1234 VW',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 1,
                  color: Color(0xFF423838),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
