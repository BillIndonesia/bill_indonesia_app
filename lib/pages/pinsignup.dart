import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:bill/pages/confirmpin.dart';

class PinSignup extends StatelessWidget {
  final String nohp;
  PinSignup({this.nohp});
  @override
  Widget build(BuildContext context) {
    return PinSignupPage(nohp);
  }
}

class PinSignupPage extends StatefulWidget {
  final String nomer;
  PinSignupPage(this.nomer);
  @override
  PinSignupPageState createState() => new PinSignupPageState();
}

class PinSignupPageState extends State<PinSignupPage> {
  TextEditingController pinController = TextEditingController();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0XFF0485AC),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Stack(children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Image.asset('images/bgpolos.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.fill),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.05),
                          width: MediaQuery.of(context).size.width * 0.35,
                      child: FittedBox(
                        child: Text(
                          'Buat 6 digit PIN Anda',
                          textAlign: TextAlign.center,
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
                            horizontal:
                                MediaQuery.of(context).size.height * 0.01),
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
                          pinBoxDecoration: ProvidedPinBoxDecoration
                              .underlinedPinBoxDecoration,
                          onTextChanged: (text) {
                            setState(() {
                              hasError = false;
                            });
                          },
                        )),
                    Visibility(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: FittedBox(
                              child: Text(
                            "Isi Semua Kolom",
                            style: TextStyle(
                                color: Colors.red[800],
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ))),
                      visible: hasError,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05),
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
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (context) => new ConfirmPin(
                                      pin: pinController.text,
                                      nohp: widget.nomer)));
                            }
                          },
                          color: Color(0xFF0A9ABC),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              // color: Colors.red,
                              child: FittedBox(
                                  child: Text('Lanjut',
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.white,
                                          fontFamily: 'Montserrat')))),
                        ))
                  ]))
            ])));
  }
}
