import 'package:bill/home_page/view/home_screen.dart';
import 'package:flutter/material.dart';

class PaymentResultBackDialog extends StatelessWidget {
  const PaymentResultBackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.width * 0.06,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xFFF4F7F8)),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              // color: Colors.green,
              width: MediaQuery.of(context).size.width * 0.5,
              child: FittedBox(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: new TextSpan(
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF999494),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'),
                    children: <TextSpan>[
                      new TextSpan(text: 'sudah menunjukkan\n'),
                      new TextSpan(
                        text: 'halaman ini kepada supir ?',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: FittedBox(
                      child: Text(
                        'Sudah',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF999494),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(
                        builder: (context) => new HomePage(),
                      ),
                    );
                  },
                ),
                MaterialButton(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: FittedBox(
                      child: Text(
                        'Belum',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0B8CAD),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
