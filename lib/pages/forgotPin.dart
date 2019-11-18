import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ForgotPin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ForgotPinPage();
  }
}

class ForgotPinPage extends StatefulWidget {
  @override
  _ForgotPinPageState createState() => _ForgotPinPageState();
}

class _ForgotPinPageState extends State<ForgotPinPage> {
  final emailController = TextEditingController();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      onChanged: (text) {
        setState(() {
          hasError = false;
          });
      },
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
          color: Color(0xFF93CCDA), fontSize: 22.0, fontFamily: 'Montserrat'),
      textAlign: TextAlign.center,
      showCursor: false,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Email',
        hintStyle: TextStyle(
            color: Color(0xFF93CCDA), fontSize: 22.0, fontFamily: 'Montserrat'),
      ),
    );

    final kirimButton = Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: () {
          if (emailController.text == '') {
            setState(() {
              hasError = true;
              });
          } else {
            kirimEmail();
          }
        },
        color: Color(0xFF0A9ABC),
        child: Text('Kirim',
            style: TextStyle(
                color: Colors.white, 
                fontFamily: 'Montserrat', 
                fontSize: 20.0)),
      ),
    );

    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0XFF0485AC),
        body: Center(
          child: Stack(children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Image.asset('images/bgpolos.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.fill)),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.22),
                  child: Column(
                  children: <Widget>[
                    Text('Masukan Email anda',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16.0,
                            color: Color(0xFFF4F7F8)),
                        textAlign: TextAlign.center),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    email,
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.width * 0.02,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colors.white, width: 3.0)))),
                    Visibility(
                      child: Text(
                              "Masukan Nomor Telepon",
                              style: TextStyle(
                                color: Colors.red[800],
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                            ),
                      visible: hasError,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    kirimButton,
                  ],
                )),
              ]),
        ),
      ),
    );
  }

  void kirimEmail() async {
    var url = 'https://bill.co.id/resetPassword';
    final response = await http.post(url, body: {
      'username': '081224037210',
      'password': '131313',
      'email': emailController.text
    });

    if (response.statusCode == 200) {
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
                  child: Text('Silahkan periksa Email anda',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF999494)),
                      textAlign: TextAlign.center),
                )));
      });
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
                      child: Text('Kesalahan Server',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF999494)),
                          textAlign: TextAlign.center),
                    )));
          });
    }
  }
}
