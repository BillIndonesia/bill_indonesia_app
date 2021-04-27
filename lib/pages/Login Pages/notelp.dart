import 'package:bill/models/authentification.dart';
import 'package:bill/pages/Login%20Pages/loginAngkot.dart';
import 'package:bill/pages/Login%20Pages/pin.dart';
import 'package:bill/pages/getotp.dart';
import 'package:bill/pages/intro.dart';
import 'package:bill/pages/termCondition.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return NoTelpPage();
  }
}

class NoTelpPage extends StatefulWidget {
  @override
  _NoTelpPageState createState() => _NoTelpPageState();
}

class _NoTelpPageState extends State<NoTelpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final noHpController = TextEditingController();
  var termVal = false;
  var _isLoading = false;
  bool hasError = false;
  // Page Function
  void _submit() async {
    try {
      if (!_formKey.currentState.validate()) {
        // Invalid!
        return;
      }
      _formKey.currentState.save();
      setState(
        () {
          _isLoading = true;
        },
      );

      await Provider.of<Authentification>(context)
              .signinNomor(noHpController.text, context)
          ? Navigator.of(context, rootNavigator: true).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Pin(
                  nohp: noHpController.text,
                ),
              ),
            )
          : Navigator.of(context).pushReplacement(
              new MaterialPageRoute(
                builder: (context) => new GetOtp(
                  nohp: noHpController.text,
                ),
              ),
            );
    } catch (e) {
      setState(
        () {
          _isLoading = false;
        },
      );
    }
    if (mounted) {
      print('mounted : $mounted');
      setState(
        () {
          _isLoading = false;
        },
      );
    }
  }

  //Page View
  @override
  Widget build(BuildContext context) {
    var deviceSizeHeight = MediaQuery.of(context).size.height;
    var deviceSizeWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new Intro(),
          ),
        );
        return;
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(
              new FocusNode(),
            );
          },
          child: Stack(
            children: <Widget>[
              //setingan Background
              Container(
                child: Image.asset(
                  'images/bgpolos.png',
                  width: deviceSizeWidth,
                  height: deviceSizeHeight,
                  fit: BoxFit.fill,
                ),
              ),
              //Page Content
              Container(
                margin: EdgeInsets.only(top: deviceSizeHeight * 0.23),
                child: Column(
                  children: <Widget>[
                    //Text Masukkan nomor Telephone
                    Container(
                      width: deviceSizeWidth * 0.7,
                      margin: EdgeInsets.only(bottom: deviceSizeHeight * 0.05),
                      child: FittedBox(
                        child: Text(
                          'Masukan nomor telephone anda',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    //Tempat input nomor
                    Container(
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          onChanged: (text) {
                            setState(() {
                              hasError = false;
                            });
                          },
                          controller: noHpController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(13)
                          ],
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              color: Color(0xFF93CCDA),
                              fontSize: 28.0,
                              fontFamily: 'Montserrat'),
                          textAlign: TextAlign.center,
                          showCursor: false,
                          autofocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nomor  Telepon',
                            hintStyle: TextStyle(
                                color: Color(0xFF93CCDA),
                                fontSize: 28.0,
                                fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ),
                    //Jika Tidak memasukkan nomor muncul Pop Up ini
                    Visibility(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: FittedBox(
                          child: Text(
                            "Masukan Nomor Telepon",
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
                    //TermCondition Checklis
                    Column(
                      children: <Widget>[
                        Container(
                          width: deviceSizeWidth * 0.3,
                          height: deviceSizeHeight * 0.02,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 3.0),
                            ),
                          ),
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
                                                            new TermCondition(),
                                                      ),
                                                    );
                                                  },
                                          ),
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
                                                            new TermCondition(),
                                                      ),
                                                    );
                                                  },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
//button Lanjut (Muncul jika TermCondition dichecklis)
                        Visibility(
                          visible: termVal,
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                )
                              : FlatButton(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    // color: Colors.red,
                                    child: FittedBox(
                                      child: Text(
                                        'Lanjut',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    _submit();
                                  },
                                ),
                        ),
                      ],
                    ),
                    //Masuk Dengan MEthode Lain
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.35),
                      child: FlatButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: FittedBox(
                            child: Text(
                              'masuk dengan metode lain',
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
                              builder: (context) => new LoginAngkot(),
                            ),
                          );
                        },
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
}
