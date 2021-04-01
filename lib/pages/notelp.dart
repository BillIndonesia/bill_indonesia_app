import 'package:bill/pages/loginAngkot.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bill/pages/pin.dart';
import 'package:bill/pages/getotp.dart';
import 'package:bill/pages/suspend.dart';
import 'package:bill/pages/termCondition.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:random_string/random_string.dart';

class NoTelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoTelpPage();
  }
}

class NoTelpPage extends StatefulWidget {
  @override
  NoTelpPageState createState() => new NoTelpPageState();
}

class NoTelpPageState extends State<NoTelpPage> {
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
          child: Stack(
            children: <Widget>[
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
                    top: MediaQuery.of(context).size.height * 0.23),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.05),
                      child: FittedBox(
                        child: Text(
                          'Masukan nomor telephone anda',
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
                        inputFormatters: [LengthLimitingTextInputFormatter(13)],
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
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.02,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white, width: 3.0),
                            ),
                          ),
                        ),
                        Visibility(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              // color: Colors.red,
                              child: FittedBox(
                                  child: Text(
                                "Masukan Nomor Telepon",
                                style: TextStyle(
                                    color: Colors.red[800],
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
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
                                              type: MaterialType.transparency);
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void lanjut() async {
    if (nohpController.text[0] != '0') {
      nohp = '0' + nohpController.text;
    } else {
      nohp = nohpController.text;
    }
    var url = 'https://bill.co.id/searchNotelp';
    final response = await http.post(url, body: {
      'notelp': nohp,
    });

    if (response.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      if (response.body == "Tidak") {
        var otpCodeGenerator = int.parse(randomNumeric(4));
        var otpCode = otpCodeGenerator.toString().padRight(4, '0');
        var noOtp = int.parse(nohp);
        // var otpCode = 1234;
        // final otp = await http.post(
        //     'https://reguler.zenziva.net/apps/smsotp.php?userkey=s72hka&passkey=tymd0qzz8j&nohp=$noOtp&kode_otp=$otpCode');
        print("kode otp: ${otpCodeGenerator.toString()}");
        print("kode otp: ${otpCode.toString()}");
        final otp = await http.post(
            'https://alpha.zenziva.net/apps/smsapi.php?userkey=63rtc4&passkey=OdooOdooNg&nohp=$noOtp&pesan=$otpCode&type=otp');
        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => new GetOtp(
              nohp: nohp,
              otpCode: otpCode.toString(),
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
