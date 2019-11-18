import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:bill/pages/saya.dart';
import 'package:bill/pages/getotp.dart';
import 'package:random_string/random_string.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class UbahNohp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UbahNohpPage();
  }
}

class UbahNohpPage extends StatefulWidget {
  @override
  UbahNohpPageState createState() => new UbahNohpPageState();
}

class UbahNohpPageState extends State<UbahNohpPage> {
  final nohpController = TextEditingController();
  final pinController = TextEditingController();
  var nohp = '';
  var pin = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
      },
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Container(
                width: MediaQuery.of(context).size.width * 0.28,
                child: FittedBox(
                  child: Text('Ubah No Hp',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF423838))))),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color(0xFF777E81), size: 30),
                  onPressed: () {
                    Navigator.pop(context, false);
                  }),
              backgroundColor: Color(0xFFF4F7F8),
              elevation: 0.0),
          backgroundColor: Color(0xFFF4F7F8),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Column(children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.045,
                          MediaQuery.of(context).size.width * 0.05,
                          MediaQuery.of(context).size.width * 0.045,
                          0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.24,
                        child: FittedBox(
                          child: Text('Nomor Baru',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF5A5B5C)))))),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.045,
                          MediaQuery.of(context).size.width * 0.00,
                          MediaQuery.of(context).size.width * 0.045,
                          MediaQuery.of(context).size.width * 0.00),
                      child: TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(13)],
                        keyboardType: TextInputType.phone,
                        controller: nohpController,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF6C6565)),
                        textAlign: TextAlign.left,
                        decoration: new InputDecoration(
                          focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                              color: Colors.black87, width: 1.0
                            )
                          )
                        ),
                      ))
                ])),
                Visibility(
                    visible: nohpController.text != '' ? true : false,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.045,
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.width * 0.045,
                            MediaQuery.of(context).size.width * 0.045),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF8b8484)),
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {
                              ubah();
                            },
                            color: Color(0xFF0B8CAD),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.14,
                              child: FittedBox(
                                child: Text('Ubah',
                                style: TextStyle(
                                    color: Color(0xFFF4F7F8),
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)))))))
              ])),
    );
  }

  void ubah() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
    });
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF4F7F8),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                padding:
                    EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * 0.04,
                      right: MediaQuery.of(context).size.height * 0.04,
                      top: MediaQuery.of(context).size.width * 0.04,),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: FittedBox(
                            child: Text('Masukan PIN Anda',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF6C6565))))),
                        // TextFormField(
                        //   inputFormatters: [
                        //     LengthLimitingTextInputFormatter(6)
                        //   ],
                        //   obscureText: true,
                        //   keyboardType: TextInputType.number,
                        //   controller: pinController,
                        //   style: TextStyle(
                        //       fontFamily: 'Montserrat',
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.normal,
                        //       color: Color(0xFF6C6565)),
                        //   textAlign: TextAlign.left,
                        // )
                        PinCodeTextField(
                          autofocus: true,
                          controller: pinController,
                          hideCharacter: true,
                          maxLength: 6,
                          highlight: true,
                          highlightColor: Colors.lightGreen[400],
                          hasTextBorderColor: Color(0xFF0B8CAD),
                          defaultBorderColor: Color(0xFF0B8CAD),
                          errorBorderColor: Colors.red[800],
                          maskCharacter: '•',
                          pinTextStyle: TextStyle(fontSize: 30),
                          pinCodeTextFieldLayoutType:
                              PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH,
                          pinBoxHeight: MediaQuery.of(context).size.height * 0.07,
                          pinBoxWidth: MediaQuery.of(context).size.width * 0.09,
                          pinBoxDecoration: ProvidedPinBoxDecoration
                              .underlinedPinBoxDecoration,
                        ),
                      // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      FlatButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.14,
                          child: FittedBox(
                            child: Text('Selesai',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xFF0B8CAD))))),
                        onPressed: () async {
                          if (pinController.text != '') {
                            if (pinController.text == pin) {
                              // Navigator.pop(context,false);
                              var otpCode = int.parse(randomNumeric(4));
                              var noOtp = int.parse(nohpController.text);
                              // var otpCode = 1234;
                              final otp = await http.post(
                                  'https://reguler.zenziva.net/apps/smsotp.php?userkey=s72hka&passkey=tymd0qzz8j&nohp=$noOtp&kode_otp=$otpCode');
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (context) => new GetOtp(
                                      nohp: nohpController.text,
                                      otpCode: otpCode.toString(),
                                      tipe: 'ubah')));
                            } else {
                              Navigator.pop(context, false);
                              setState(() {
                                pinController.text = '';
                                });
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
                                          child: Text('PIN yang anda masukan salah',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Color(0xFF999494)),
                                              textAlign: TextAlign.center),
                                        )));
                              });
                            }
                          } else {
                            return null;
                          }
                        },
                      )
                    ])),
          );
        });
  }
}
