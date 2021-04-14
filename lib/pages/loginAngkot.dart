import 'package:bill/pages/notelp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bill/pages/pin.dart';
import 'package:bill/pages/getotp.dart';
import 'package:bill/pages/suspend.dart';
import 'package:bill/pages/termCondition.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:random_string/random_string.dart';

class LoginAngkot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginAngkotPage();
  }
}

class LoginAngkotPage extends StatefulWidget {
  @override
  LoginAngkotPageState createState() => new LoginAngkotPageState();
}

class LoginAngkotPageState extends State<LoginAngkotPage> {
  final nohpController = TextEditingController();
  bool termVal = false;
  var nohp;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        },
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Color(0XFF0485AC),
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Stack(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Image.asset('images/bgpolos.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.fill),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.23),
                      child: Column(children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.05),
                          child: FittedBox(
                            child: Text(
                              'Masukan ID vendor Anda',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            onChanged: (text) {
                              setState(() {
                                hasError = false;
                              });
                            },
                            controller: nohpController,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(13)
                            ],
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                color: Color(0xFF93CCDA),
                                fontSize: 28.0,
                                fontFamily: 'Montserrat'),
                            textAlign: TextAlign.center,
                            showCursor: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ID Vendor',
                              hintStyle: TextStyle(
                                  color: Color(0xFF93CCDA),
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                        Column(children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.width * 0.02,
                            decoration: BoxDecoration(
                              border: Border(
                                top:
                                    BorderSide(color: Colors.white, width: 3.0),
                              ),
                            ),
                          ),
                          Visibility(
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                // color: Colors.red,
                                child: FittedBox(
                                    child: Text(
                                  "Masukan ID Vendor",
                                  style: TextStyle(
                                      color: Colors.red[800],
                                      fontFamily: 'Montserrat',
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600),
                                ))),
                            visible: hasError,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Checkbox(
                                      activeColor: Color(0XFF0485AC),
                                      value: termVal,
                                      onChanged: (bool value) {
                                        setState(() {
                                          termVal = value;
                                        });
                                      },
                                    ),
                                    Expanded(
                                        child: Container(
                                            // color: Colors.red,
                                            child: FittedBox(
                                                child: RichText(
                                      textAlign: TextAlign.center,
                                      text: new TextSpan(
                                        style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                        ),
                                        children: <TextSpan>[
                                          new TextSpan(text: 'Setuju dengan '),
                                          new TextSpan(
                                              text: 'Ketentuan Layanan ',
                                              style: new TextStyle(
                                                  decoration:
                                                      TextDecoration.underline),
                                              recognizer:
                                                  new TapGestureRecognizer()
                                                    ..onTap = () {
                                                      Navigator.of(context).push(
                                                          new MaterialPageRoute(
                                                              builder: (context) =>
                                                                  new TermCondition()));
                                                    }),
                                          new TextSpan(text: 'dan '),
                                          new TextSpan(
                                              text: 'Kebijakan Privasi',
                                              style: new TextStyle(
                                                  decoration:
                                                      TextDecoration.underline),
                                              recognizer:
                                                  new TapGestureRecognizer()
                                                    ..onTap = () {
                                                      Navigator.of(context).push(
                                                          new MaterialPageRoute(
                                                              builder: (context) =>
                                                                  new TermCondition()));
                                                    }),
                                        ],
                                      ),
                                    )))),
                                  ])),
                          // SizedBox(
                          //     height: MediaQuery.of(context).size.height * 0.001),
                          Visibility(
                              visible: termVal,
                              child: FlatButton(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      // color: Colors.red,
                                      child: FittedBox(
                                          child: Text('Lanjut',
                                              style: TextStyle(
                                                  fontSize: 22.0,
                                                  color: Colors.white,
                                                  fontFamily: 'Montserrat')))),
                                  onPressed: () {
                                    if (nohpController.text == '') {
                                      setState(() {
                                        hasError = true;
                                      });
                                    } else {
                                      lanjut();
                                      return showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Material(
                                                type:
                                                    MaterialType.transparency);
                                          });
                                    }
                                  })),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.35),
                            child: FlatButton(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: FittedBox(
                                  child: Text(
                                    'Atau masuk dengan metode lain',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  new MaterialPageRoute(
                                    builder: (context) => new NoTelp(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]),
                      ]))
                ]))));
  }

  void lanjut() async {
    nohp = nohpController.text;
    // if (nohpController.text[0] != '0') {
    //   nohp = '0' + nohpController.text;
    // } else {
    //   nohp = nohpController.text;
    // }
    var url = 'https://bill.co.id/searchNotelp';
    final response = await http.post(url, body: {
      'notelp': nohp,
    });

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      if (response.body == "Tidak") {
        print('tidak');
        return showDialog(
          context: context,
          builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.06),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF4F7F8)),
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
                            new TextSpan(text: 'Mohon maaf \n'),
                            new TextSpan(text: 'nomor anda belum terdaftar '),
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
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      } else if (response.body == 'Iya' || response.body == 'Vendor') {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => new Pin(nohp: nohp)));
      } else if (response.body == 'Suspend') {
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => new Suspend(),
          ),
        );
      } else {
        return showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF4F7F8)),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: FittedBox(
                                child: Text('Admin tidak bisa masuk',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: Color(0xFF999494)),
                                    textAlign: TextAlign.center))),
                      )));
            });
      }
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF4F7F8)),
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                      child: Container(
                          child: FittedBox(
                              child: Text('Kesalahan Server',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xFF999494)),
                                  textAlign: TextAlign.center))),
                    )));
          });
    }
  }
}