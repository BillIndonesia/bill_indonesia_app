import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Container(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.2,
              child: FittedBox(
                child: Text(
                  'Tentang',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF423838),
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF777E81),
                size: 30,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Color(0xFFF4F7F8),
            elevation: 0.0),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // color: Colors.red,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.08,
              ),
              height: MediaQuery.of(context).size.height * 0.06,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/bill biru.png',
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.04),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/tentang.png',
              ),
            ),
            Container(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.65,
              child: FittedBox(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF999494),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Montserrat'),
                    children: <TextSpan>[
                      TextSpan(text: 'Platform Digital\n'),
                      TextSpan(text: 'untuk pembayaran harianmu'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.12,
                bottom: MediaQuery.of(context).size.height * 0.06,
              ),
              child: FittedBox(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF999494),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Montserrat'),
                    children: <TextSpan>[
                      TextSpan(text: 'Bill V.0.8.6\n'),
                      TextSpan(text: '© 2019 Copyright Bill'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
