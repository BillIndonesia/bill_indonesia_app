import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'dart:async';
import 'package:bill/pages/pinsignup.dart';
import 'package:bill/pages/profile.dart';
import 'package:random_string/random_string.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:toast/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetOtp extends StatelessWidget {
  final String otpCode;
  final String nohp;
  final String tipe;
  GetOtp({this.otpCode, this.nohp, this.tipe});

  @override
  Widget build(BuildContext context) {
    return GetOtpPage(otpCode, nohp, tipe);
  }
}

class GetOtpPage extends StatefulWidget {
  final String code;
  final String nomer;
  final String tp;
  GetOtpPage(this.code, this.nomer, this.tp);

  @override
  GetOtpPageState createState() => new GetOtpPageState();
}

class GetOtpPageState extends State<GetOtpPage> {
  TextEditingController pinController = TextEditingController();
  var onTapRecognizer;
  PinCodeTextField pinCodeTextFieldWidget;
  bool hasError = false;
  var kodeOtp = 0;
  Timer _timer;
  int _start = 60;
  bool _disabled = true;

  @override
  void initState() {
    startTimer();

    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        if (_disabled == true) {
          Toast.show("Tunggu 1 Menit", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        } else {
          setState(() {
            kodeOtp = int.parse(randomNumeric(4));
            _disabled = true;
            _start = 60;
            startTimer();
          });
          final otp = await http.post(
              'https://reguler.zenziva.net/apps/smsotp.php?userkey=s72hka&passkey=tymd0qzz8j&nohp=${int.parse(widget.nomer)}&kode_otp=$kodeOtp');
          Toast.show("Kode OTP sudah terkirim", context,
              duration: Toast.LENGTH_LONG, 
              gravity: Toast.BOTTOM);
        }
      };

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pinCodeTextFieldWidget = PinCodeTextField(
        autofocus: false,
        controller: pinController,
        maxLength: 4,
        hasError: hasError,
        highlight: true,
        highlightColor: Colors.lightGreen[400],
        hasTextBorderColor: Color(0xFFF4F7F8),
        defaultBorderColor: Color(0xFFF4F7F8),
        errorBorderColor: Colors.red[800],
        pinBoxHeight: MediaQuery.of(context).size.height * 0.07,
        pinBoxWidth: MediaQuery.of(context).size.width * 0.15,
        pinTextStyle: TextStyle(fontSize: 25, fontFamily: 'Montserrat'),
        pinCodeTextFieldLayoutType: PinCodeTextFieldLayoutType.WRAP,
        pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
        onTextChanged: (text) {
          setState(() {
            hasError = false;
          });
        });
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
                child: Image.asset('images/bgotp.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.fill)),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.55 - (MediaQuery.of(context).viewInsets.bottom * 0.25),
                  // bottom: MediaQuery.of(context).viewInsets.bottom
                  ),
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.045),
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: FittedBox(
                        child: RichText(
                          text: TextSpan(
                              text: "Masukan kode yang dikirim ke ",
                              children: [
                                TextSpan(
                                    text: widget.nomer,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ],
                              style:
                                  TextStyle(color: Colors.white54, fontSize: 15)),
                          textAlign: TextAlign.center,
                        ))),
                  Container(
                      // color: Colors.red,
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                    child: pinCodeTextFieldWidget),
                  Visibility(
                    child: pinController.text.length < 4
                        ? Container(
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
                          )))
                        : Container(
                          width: MediaQuery.of(context).size.width * 0.32,
                          child: FittedBox(
                            child: Text(
                            "Kode OTP Tidak Sesuai",
                            style: TextStyle(
                                  color: Colors.red[800],
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ))),
                    visible: hasError,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _start.toString().length != 1
                            ? Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: FittedBox(
                                child: Text("\n\n00 : $_start",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))))
                            : Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              child: FittedBox(
                                child: Text("\n\n00 : 0$_start",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))))
                      ]),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.52,
                    child: FittedBox(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Tidak menerima kode? ",
                            style: TextStyle(color: Colors.black54, fontSize: 15),
                            children: [
                              TextSpan(
                                  text: " Kirim Ulang",
                                  recognizer: onTapRecognizer,
                                  style: TextStyle(
                                      color: Color(0xFFF4F7F8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ])))),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.03,
                        horizontal: 30),
                    child: ButtonTheme(
                      height: 50,
                      child: FlatButton(
                        onPressed: () async {
                          if (pinController.text.length < 4) {
                            setState(() {
                              hasError = true;
                            });
                          } else {
                            if (kodeOtp == 0) {
                              if (pinController.text == widget.code) {
                                // Navigator.pop(context, true);
                                if (widget.tp != 'ubah') {
                                  Navigator.of(context)
                                      .pushReplacement(new MaterialPageRoute(
                                          builder: (context) => new PinSignup(
                                                nohp: widget.nomer,
                                              )));
                                } else {
                                  ubahNo();
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Material(
                                            type: MaterialType.transparency);
                                      });
                                }
                              } else {
                                setState(() {
                                  hasError = true;
                                });
                              }
                            } else {
                              if (pinController.text == kodeOtp.toString()) {
                                // Navigator.pop(context, true);
                                if (widget.tp != 'ubah') {
                                  Navigator.of(context)
                                      .push(new MaterialPageRoute(
                                          builder: (context) => new PinSignup(
                                                nohp: widget.nomer,
                                              )));
                                } else {
                                  ubahNo();
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Material(
                                            type: MaterialType.transparency);
                                      });
                                }
                              } else {
                                setState(() {
                                  hasError = true;
                                });
                              }
                            }
                          }
                        },
                        child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: FittedBox(
                                child: Text(
                                "Verifikasi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )))),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF0A9ABC),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              )),
            ),
          ])),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            setState(() {
              _disabled = false;
            });
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  void ubahNo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nohp = prefs.getString('nohp');
    var pin = prefs.getString('pin');
    var url = 'https://bill.co.id/changeNohp';
    final response = await http.post(url,
        body: {'username': nohp, 'password': pin, 'nohp': widget.nomer});

    if (response.body == 'True') {
      Navigator.of(context, rootNavigator: true).pop();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nohp', widget.nomer);

      Navigator.of(context)
          .push(new MaterialPageRoute(builder: (context) => new Profile()));
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                        child: Text('Gagal',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w600,
                                fontSize: 16)))));
          });
    }
  }
}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
