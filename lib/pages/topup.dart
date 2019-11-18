import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TopUpPage();
  }
}

class TopUpPage extends StatefulWidget {
  @override
  TopUpPageState createState() => new TopUpPageState();
}

class TopUpPageState extends State<TopUpPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => new Home()));
      },
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Container(
                // color: Colors.red,
                // color: Colors.red,
                width: MediaQuery.of(context).size.width * 0.15,
                child: FittedBox(
                  child: Text('Top Up',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF423838))))),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color(0xFF777E81), size: 30),
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => new Home()))),
              backgroundColor: Color(0xFFF4F7F8),
              elevation: 0.0),
          body: Column(children: <Widget>[
            GestureDetector(
                onTap: () {},
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    // color: Colors.red,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              height: MediaQuery.of(context).size.width * 0.09,
                              // color: Colors.green,
                              child: Image.asset('images/debitcard.png'))),
                      Expanded(
                          flex: 3,
                          child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.09),
                              // color: Colors.yellow,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('Debit Card',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF423838),
                                            fontSize: 16)))),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Container(
                                    // color: Colors.green,
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: FittedBox(
                                      child: RichText(
                                      text: new TextSpan(
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xFF999494),
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Montserrat'),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text:
                                                  'Gunakan kartu debit mu untuk\n'),
                                          new TextSpan(
                                              text:
                                                  'melakukan Top Up'),
                                        ],
                                      ),
                                    ))),
                                  ])))
                    ]))),
            GestureDetector(
                onTap: () {},
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    // color: Colors.red,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              height: MediaQuery.of(context).size.width * 0.09,
                              // color: Colors.green,
                              child: Image.asset('images/minimart.png'))),
                      Expanded(
                          flex: 3,
                          child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.09),
                              // color: Colors.yellow,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width * 0.22,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('Minimart',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF423838),
                                            fontSize: 16)))),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Container(
                                    // color: Colors.green,
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: FittedBox(
                                      child: RichText(
                                      text: new TextSpan(
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xFF999494),
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Montserrat'),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text:
                                                  'Top Up saldo mu di minimart\n'),
                                          new TextSpan(
                                              text:
                                                  'terdekat'),
                                        ],
                                      ),
                                    ))),
                                  ])))
                    ]))),
            GestureDetector(
                onTap: () {},
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    // color: Colors.red,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              height: MediaQuery.of(context).size.width * 0.09,
                              // color: Colors.green,
                              child:
                                  Image.asset('images/internetbanking.png'))),
                      Expanded(
                          flex: 3,
                          child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.09),
                              // color: Colors.yellow,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width * 0.38,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('Internet Banking',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF423838),
                                            fontSize: 16)))),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Container(
                                    // color: Colors.green,
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    child: FittedBox(
                                      child: RichText(
                                      text: new TextSpan(
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xFF999494),
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Montserrat'),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text:
                                                  'Top Up dimanapun menggunakan\n'),
                                          new TextSpan(
                                              text:
                                                  'internet banking mu'),
                                        ],
                                      ),
                                    ))),
                                  ])))
                    ]))),
            GestureDetector(
                onTap: () {},
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    // color: Colors.red,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              height: MediaQuery.of(context).size.width * 0.09,
                              // color: Colors.green,
                              child: Image.asset('images/mobilebanking.png'))),
                      Expanded(
                          flex: 3,
                          child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.09),
                              // color: Colors.yellow,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width * 0.355,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('Mobile Banking',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF423838),
                                            fontSize: 16)))),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Container(
                                    // color: Colors.green,
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    child: FittedBox(
                                      child: RichText(
                                      text: new TextSpan(
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xFF999494),
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Montserrat'),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text:
                                                  'Top Up di handphone mu melalui\n'),
                                          new TextSpan(
                                              text:
                                                  'aplikasi mobile banking'),
                                        ],
                                      ),
                                    ))),
                                  ])))
                    ]))),
            GestureDetector(
                onTap: () {},
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    // color: Colors.red,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.09,
                              height: MediaQuery.of(context).size.width * 0.09,
                              // color: Colors.green,
                              child: Image.asset('images/atm.png'))),
                      Expanded(
                          flex: 3,
                          child: Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.09),
                              // color: Colors.yellow,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                   Container(
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width * 0.1,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text('ATM',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF423838),
                                            fontSize: 16)))),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Container(
                                    // color: Colors.green,
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: FittedBox(
                                      child: RichText(
                                      text: new TextSpan(
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xFF999494),
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Montserrat'),
                                        children: <TextSpan>[
                                          new TextSpan(
                                              text:
                                                  'Top Up di mesin terdekat'),
                                        ],
                                      ),
                                    ))),
                                  ])))
                    ])))
          ])),
    );
  }
}
