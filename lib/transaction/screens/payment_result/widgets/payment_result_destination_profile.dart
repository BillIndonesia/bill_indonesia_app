import 'dart:convert';
import 'dart:typed_data';
import 'package:bill/packages/camera/bloc/qr_scanned_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PaymentResultDestinationProfile extends StatelessWidget {
  const PaymentResultDestinationProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.read<QrScannedBloc>().state.transactionData;

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            //Decorasi Image
            decoration: data['merchant_image'] != null
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: MemoryImage(
                        base64.decode(
                          data['merchant_image'],
                        ),
                      ),
                    ),
                  )
                : BoxDecoration(shape: BoxShape.circle),
            //Bolean Image
            child: data['merchant_image'] == null
                ? CircleAvatar(
                    backgroundColor: Color(0xFF0485AC),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: FittedBox(
                        child: Text(
                          data['merchant_name'].toString().toUpperCase()[0],
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
                data['merchant_name'],
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
