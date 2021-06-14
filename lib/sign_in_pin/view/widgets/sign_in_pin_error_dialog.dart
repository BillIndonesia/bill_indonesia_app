import 'package:flutter/material.dart';

class SignInPinErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.005,
          vertical: MediaQuery.of(context).size.width * 0.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFF4F7F8),
        ),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.1,
              child: FittedBox(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF999494),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Anda Telah Salah Memasukkan PIN sebanyak 3x\n',
                      ),
                      new TextSpan(
                        text: 'Harap coba lagi setelah 60 detik',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                child: FittedBox(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(
                        0xFF0B8CAD,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
