import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:bill/pages/saya.dart';

class UbahPin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UbahPinPage();
  }
}

class UbahPinPage extends StatefulWidget {
  @override
  UbahPinPageState createState() => new UbahPinPageState();
}

class UbahPinPageState extends State<UbahPinPage> {
  final lamaController = TextEditingController();
  final baruController = TextEditingController();
  final confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
              title: Text('Ubah PIN',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF423838))),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color(0xFF777E81), size: 30),
                  onPressed: () {
                    Navigator.pop(context, false);
                  }),
              backgroundColor: Color(0xFFF4F7F8),
              elevation: 0.0),
          backgroundColor: Color(0xFFF4F7F8),
          body: Form(
              key: _formKey,
              child: Column(
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
                          child: Text('PIN lama',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF5A5B5C)))),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.00,
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.00),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6)
                            ],
                            keyboardType: TextInputType.number,
                            controller: lamaController,
                            validator: (value) {
                              if (value.length == 6) {
                                if (value == pin) {
                                  return null;
                                } else {
                                  return 'PIN tidak benar';
                                }
                              } else {
                                return 'PIN harus 6 digit';
                              }
                              return null;
                            },
                            obscureText: true,
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
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.05,
                              MediaQuery.of(context).size.width * 0.045,
                              0),
                          child: Text('PIN baru',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF5A5B5C)))),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.00,
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.00),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6)
                            ],
                            keyboardType: TextInputType.number,
                            controller: baruController,
                            validator: (value) {
                              if (value.length == 6) {
                                return null;
                              } else {
                                return 'PIN harus 6 digit';
                              }
                              return null;
                            },
                            obscureText: true,
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
                          )),
                      Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.05,
                              MediaQuery.of(context).size.width * 0.045,
                              0),
                          child: Text('Konfirmasi PIN',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF5A5B5C)))),
                      Container(
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.00,
                              MediaQuery.of(context).size.width * 0.045,
                              MediaQuery.of(context).size.width * 0.00),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6)
                            ],
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            controller: confirmController,
                            validator: (value) {
                              if (value.length == 6) {
                                if (value == baruController.text) {
                                  return null;
                                } else {
                                  return 'PIN tidak sesuai';
                                }
                              } else {
                                return 'PIN harus 6 digit';
                              }
                              return null;
                            },
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
                        visible: (lamaController.text != '') &&
                                (baruController.text != '') &&
                                (confirmController.text != '')
                            ? true
                            : false,
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
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    change(context);
                                  }
                                },
                                color: Color(0xFF0B8CAD),
                                child: Text('Ubah',
                                    style: TextStyle(
                                        color: Color(0xFFF4F7F8),
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)))))
                  ]))),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
    });
  }

  void change(context) async {
    var url = 'https://bill.co.id/changePassword';
    final response = await http.post(url,
        body: {'username': nohp, 'password': pin, 'baru': baruController.text});

    if (response.body == 'True') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('pin', baruController.text);

      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Saya()));
    } else {
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
