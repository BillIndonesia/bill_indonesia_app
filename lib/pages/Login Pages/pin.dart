import 'package:bill/pages/Login%20Pages/notelp.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:convert';
import 'package:bill/pages/forgotPin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:bill/firebase_notification.dart';

import '../../main.dart';

class Pin extends StatelessWidget {
  final String nohp;
  Pin({this.nohp});
  @override
  Widget build(BuildContext context) {
    return PinPage(nohp);
  }
}

class PinPage extends StatefulWidget {
  final String nomer;
  PinPage(this.nomer);
  @override
  PinPageState createState() => new PinPageState();
}

class PinPageState extends State<PinPage> {
  TextEditingController pinController = TextEditingController();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.of(context, rootNavigator: true).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0XFF0485AC),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Image.asset(
                  'images/bgpolos.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      // color: Colors.red,
                      child: FittedBox(
                        child: Text(
                          'Masukan Pin Anda',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.01,
                        horizontal: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: PinCodeTextField(
                        autofocus: true,
                        controller: pinController,
                        hideCharacter: true,
                        maxLength: 6,
                        hasError: hasError,
                        highlight: true,
                        highlightColor: Colors.lightGreen[400],
                        hasTextBorderColor: Color(0xFFF4F7F8),
                        defaultBorderColor: Color(0xFFF4F7F8),
                        errorBorderColor: Colors.red[800],
                        maskCharacter: '•',
                        pinTextStyle: TextStyle(fontSize: 30),
                        pinCodeTextFieldLayoutType:
                            PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                        pinBoxDecoration:
                            ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                        onTextChanged: (text) {
                          setState(
                            () {
                              hasError = false;
                            },
                          );
                        },
                      ),
                    ),
                    Visibility(
                      child: pinController.text.length < 6
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              // color: Colors.red,
                              child: FittedBox(
                                child: Text(
                                  "Isi Semua Kolom",
                                  style: TextStyle(
                                    color: Colors.red[800],
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              child: FittedBox(
                                child: Text(
                                  "PIN Salah",
                                  style: TextStyle(
                                      color: Colors.red[800],
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                      visible: hasError,
                    ),
                    FlatButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: FittedBox(
                          child: Text(
                            'Lupa Pin',
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
                            builder: (context) => new ForgotPin(),
                          ),
                        );
                      },
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        onPressed: () {
                          if (pinController.text.length < 6) {
                            setState(() {
                              hasError = true;
                            });
                          } else {
                            signin();
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return Material(
                                    type: MaterialType.transparency);
                              },
                            );
                          }
                        },
                        color: Color(0xFF0A9ABC),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          child: FittedBox(
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signin() async {
    var url = 'https://bill.co.id/apiflutter';
    final response = await http.post(url,
        body: {'username': widget.nomer, 'password': pinController.text});

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      if (response.body == "False") {
        setState(() {
          hasError = true;
        });
      } else {
        // Navigator.of(context, rootNavigator: true).pop();
        FirebaseNotifications().getToken();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('nohp', widget.nomer);
        prefs.setString('pin', pinController.text);

        var url2 = 'https://bill.co.id/getActive';
        final response2 = await http.post(url2, body: {
          'nohp': widget.nomer,
        });
        // print('inilohhh ${jsonDecode(response2.body)[0]['vendor_price_type']}');
        prefs.setString(
            'user_role', jsonDecode(response2.body)[0]['user_role']);
        prefs.setString(
            'vendor_type', jsonDecode(response2.body)[0]['vendor_price_type']);
        // Navigator.pop(context, false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ),
        );
        //
        // Home(
        //   usr: jsonDecode(response2.body)[0]['user_role'],
        // ),

      }
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF4F7F8)),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Text('Kesalahan Server',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF999494),
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          );
        },
      );
    }
  }
}
