import 'package:bill/home_page/view/home_screen.dart';
import 'package:bill/packages/user/model/image_mock.dart';
import 'package:flutter/material.dart';

import 'widgets/payment_result_widgets.dart';

class PaymentResultScreen extends StatelessWidget {
  const PaymentResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = ImageMockUp().image;
    return Scaffold(
      backgroundColor: Color(0xFFF4F7F8),
      body: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _statusImage(context),
                  _statusText(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  PaymentResultDestinationProfile(image: image),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.018,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  '*Tunjukan halaman ini kepada supir sebagai bukti pembayaran',
                  style: TextStyle(
                    fontFamily: 'monsetrat',
                    fontSize: 16,
                    color: Color(0xFF5A5B5C),
                  ),
                ),
              ),
            ),
            _button(context),
          ],
        ),
      ),
    );
  }

  Container _button(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      child: MaterialButton(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.035,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Text(
              'Oke',
              style: new TextStyle(
                fontSize: 16.0,
                color: Color(0xFFF4F7F8),
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ),
        color: Color(0xFF0B8CAD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            new MaterialPageRoute(
              builder: (context) => new HomePage(),
            ),
          );
          return;
        },
      ),
    );
  }

  Container _statusText(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: FittedBox(
        child: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF999494),
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat'),
            children: <TextSpan>[
              new TextSpan(text: 'Anda Berhasil membayar angkot\n'),
              new TextSpan(text: 'Sebesar Rp. 10.000 pada jam \n'),
              new TextSpan(
                text: '15:30 ',
                style: TextStyle(color: Colors.blueAccent),
              ),
              new TextSpan(text: 'kepada'),
            ],
          ),
        ),
      ),
    );
  }

  Container _statusImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.35,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        bottom: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Image(
        image: AssetImage(
          'assets/images/berhasil.png',
        ),
      ),
    );
  }
}
