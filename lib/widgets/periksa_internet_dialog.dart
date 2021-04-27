import 'package:bill/pages/home.dart';
import 'package:flutter/material.dart';

class PeriksaInternetDialog extends StatelessWidget {
  final bool gohome;
  PeriksaInternetDialog(this.gohome);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.width * 0.06),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFFF4F7F8)),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              // color: Colors.green,
              width: MediaQuery.of(context).size.width * 0.4,
              child: FittedBox(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Color(0xFF999494),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                    children: <TextSpan>[
                      new TextSpan(text: 'Mohon periksa koneksi\n'),
                      new TextSpan(text: 'internet anda '),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFF0B8CAD),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                    child: FittedBox(
                      child: Text(
                        'OK',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    gohome == true
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Home(usr: 'user'),
                            ),
                          )
                        : Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
