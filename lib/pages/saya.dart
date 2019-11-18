import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:bill/pages/detail.dart';
import 'package:bill/pages/termCondition.dart';
import 'package:bill/pages/profile.dart';
import 'package:bill/pages/bantuan.dart';
import 'package:bill/pages/notelp.dart';
import 'package:bill/pages/tentang.dart';
import 'package:bill/pages/resultVendorTopup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bill/firebase_notification.dart';
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'dart:typed_data';
import 'package:shimmer/shimmer.dart';

class Saya extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SayaPage();
  }
}

class SayaPage extends StatefulWidget {
  @override
  SayaPageState createState() => new SayaPageState();
}

class SayaPageState extends State<SayaPage> {
  var nohp = '';
  var pin = '';
  var image = '';
  var nama = '';
  List data = List();
  bool done = false;

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64.decode(image);
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => new Home()));
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/banner.png'),
                  fit: BoxFit.fill))),
            Column(children: <Widget>[
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: Column(children: <Widget>[
                        Row(children: <Widget>[
                          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: FittedBox(
                              child: IconButton(
                                icon: Icon(Icons.arrow_back,
                                    color: Color(0xFFF4F7F8), size: 30),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => new Home()));
                                }))),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.23,
                            child: FittedBox(
                              child: Text('Akun Saya',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFF4F7F8)))))
                        ]),
                        Expanded(
                          child: Container(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                              //     Expanded(
                              // child: SizedBox(height:MediaQuery.of(context).size.height * 0.0325)),
                            done == true
                                ? Container(
                                    child: Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.2,
                                        height: MediaQuery.of(context).size.width *
                                            0.2,
                                        decoration: image != ''
                                            ? BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: MemoryImage(bytes)))
                                            : BoxDecoration(
                                                shape: BoxShape.circle),
                                        child: image == ''
                                            ? CircleAvatar(
                                                backgroundColor:
                                                    Color(0xFF0485AC),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width * 0.06,
                                                  // color: Colors.red,
                                                  child: FittedBox(
                                                    child: Text(nama[0],
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Color(0xFFF4F7F8),
                                                            fontSize: 40)))))
                                            : Container()))
                                : Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  enabled: true,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle))),
                            done == true
                            ? Container(
                                  // color: Colors.red,
                                height: MediaQuery.of(context).size.height * 0.03,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.width *
                                        0.02),
                                child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text(nama,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        color: Color(0xFFF4F7F8)))))
                            : Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              enabled: true,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width *
                                      0.02),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.02)),
                            done == true
                            ? Container(
                                height: MediaQuery.of(context).size.height * 0.03,
                              // width: MediaQuery.of(context).size.width * 0.25,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width *
                                      0.02),
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Text(nohp,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: Color(0xFFF4F7F8)))))
                            : Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              enabled: true,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width *
                                      0.02),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height: MediaQuery.of(context).size.height * 0.02)),
                            // Expanded(
                            //   child: SizedBox(height:MediaQuery.of(context).size.height * 0.0325))
                          ])))
                      ]))),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10))),
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.05),
                      // color: Colors.green,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.04),
                              // height: MediaQuery.of(context).size.height * 0.069,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                // color: Colors.red,
                                width: MediaQuery.of(context).size.width * 0.08,
                                child: FittedBox(
                                  child: Text('Info',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFF999494))))))),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.04),
                                // alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Color(0xFFEBECEE))),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width * 0.03),
                                        width: MediaQuery.of(context).size.width * 0.07,
                                        height: MediaQuery.of(context).size.width * 0.07,
                                        child: Image.asset('images/bantuan.png')),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.165,
                                        // color: Colors.red,
                                        child: FittedBox(
                                          child: Text('Bantuan',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF423838)))))])),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                    child: FittedBox(
                                      child: Icon(Icons.keyboard_arrow_right,
                                         color: Color(0xFFBBB6B6)))),
                                  ]),
                                ),
                            onTap: () {
                              Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new Bantuan(tipe: 'list')));
                              })),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.04),
                                // alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Color(0xFFEBECEE))),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width * 0.03),
                                        width: MediaQuery.of(context).size.width * 0.07,
                                        height: MediaQuery.of(context).size.width * 0.07,
                                        child: Image.asset('images/ketentuan.png')),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.38,
                                        // color: Colors.red,
                                        child: FittedBox(
                                          child: Text('Ketentuan Layanan',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF423838)))))])),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                    child: FittedBox(
                                      child: Icon(Icons.keyboard_arrow_right,
                                         color: Color(0xFFBBB6B6)))),
                                  ]),
                                ),
                            onTap: () {
                              Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new TermCondition()));
                              })
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.04),
                                // alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                  color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width * 0.03),
                                        width: MediaQuery.of(context).size.width * 0.07,
                                        height: MediaQuery.of(context).size.width * 0.07,
                                        child: Image.asset('images/kebijakan.png')),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.34,
                                        // color: Colors.red,
                                        child: FittedBox(
                                          child: Text('Kebijakan Privasi',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF423838)))))])),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                    child: FittedBox(
                                      child: Icon(Icons.keyboard_arrow_right,
                                         color: Color(0xFFBBB6B6)))),
                                  ]),
                                ),
                            onTap: () {
                              Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new TermCondition()));
                              })
                          )
                      ])))),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10))),
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.height * 0.02),
                      // color: Colors.green,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                        child: Column(children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.04),
                              // height: MediaQuery.of(context).size.height * 0.069,
                              alignment: Alignment.centerLeft,
                              child: Container(
                                // color: Colors.red,
                                width: MediaQuery.of(context).size.width * 0.22,
                                child: FittedBox(
                                  child: Text('Pengaturan',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFF999494))))))),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.04),
                                // alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Color(0xFFEBECEE))),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width * 0.03),
                                        width: MediaQuery.of(context).size.width * 0.07,
                                        height: MediaQuery.of(context).size.width * 0.07,
                                        child: Image.asset('images/profil.png')),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.27,
                                        // color: Colors.red,
                                        child: FittedBox(
                                          child: Text('Sunting Profil',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF423838)))))])),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                    child: FittedBox(
                                      child: Icon(Icons.keyboard_arrow_right,
                                         color: Color(0xFFBBB6B6)))),
                                  ]),
                                ),
                            onTap: () {
                              Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new Profile()));
                              })
                          ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.04),
                                // alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Color(0xFFEBECEE))),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width * 0.03),
                                        width: MediaQuery.of(context).size.width * 0.07,
                                        height: MediaQuery.of(context).size.width * 0.07,
                                        child: Image.asset('images/about.png')),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.165,
                                        // color: Colors.red,
                                        child: FittedBox(
                                          child: Text('Tentang',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF423838)))))])),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.05,
                                    child: FittedBox(
                                      child: Icon(Icons.keyboard_arrow_right,
                                         color: Color(0xFFBBB6B6)))),
                                  ]),
                                ),
                            onTap: () {
                              Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder: (context) => new Tentang()));
                               // Navigator.of(context).pushReplacement(
                               //  new MaterialPageRoute(
                               //      builder: (context) => new Detail(
                               //          nohpResult: '05',
                               //          user_role: 'vendor',
                               //          name: 'Vendoria')));
                              })
                          ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                              padding: EdgeInsets.symmetric(
                                horizontal: MediaQuery.of(context).size.width * 0.04),
                                // alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width * 0.03),
                                        width: MediaQuery.of(context).size.width * 0.07,
                                        height: MediaQuery.of(context).size.width * 0.07,
                                        child: Image.asset('images/keluar.png')),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.14,
                                        // color: Colors.red,
                                        child: FittedBox(
                                          child: Text('Keluar',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF423838)))))]))
                                  ]),
                                ),
                            onTap: () async {
                              return showDialog(
                                context: context,
                                builder: (_) {
                                  return Dialog(
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
                                              width: MediaQuery.of(context).size.width * 0.5,
                                              child: FittedBox(
                                                child: RichText(
                                                textAlign: TextAlign.center,
                                                text: new TextSpan(
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Color(0xFF999494),
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Montserrat'),
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                        text:
                                                            'Anda yakin akan keluar\n'),
                                                    new TextSpan(
                                                        text:
                                                            'dari aplikasi ?'),
                                                  ],
                                                ),
                                              ))),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: <Widget>[
                                                      FlatButton(
                                                          child: Container(
                                                            width: MediaQuery.of(context).size.width * 0.06,
                                                            child: FittedBox(
                                                              child: Text('Iya',
                                                              style: TextStyle(
                                                                  fontFamily: 'Montserrat',
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.w600,
                                                                  color: Color(0xFF999494))))),
                                                          onPressed: () async {
                                                            Navigator.of(context, rootNavigator: true).pop();
                                                            FirebaseNotifications().deleteToken();
                                                            SharedPreferences prefs =
                                                                await SharedPreferences.getInstance();
                                                            prefs.remove('nohp');
                                                            prefs.remove('pin');
                                                            Navigator.pop(context, false);
                                                            Navigator.of(context).pushReplacement(
                                                                new MaterialPageRoute(
                                                                    builder: (context) => new NoTelp()));
                                                          }),
                                                      FlatButton(
                                                          child: Container(
                                                      width: MediaQuery.of(context).size.width * 0.1,
                                                      child: FittedBox(
                                                        child: Text('Tidak',
                                                        style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w600,
                                                            color: Color(0xFF0B8CAD))))),
                                                          onPressed: () {
                                                            Navigator.of(context, rootNavigator: true).pop();
                                                          })
                                                    ])
                                              ])));
                                });
                              })
                          )
                      ]))))
            ])]))
    );
  }

  @override
  void initState() {
    super.initState();
    this.getProfile();
  }

  void getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
    });

    var url = 'https://bill.co.id/getProfile';
    final response =
        await http.post(url, body: {'username': nohp, 'password': pin});

    data = jsonDecode(response.body);

    setState(() {
      if (data[0]['image'] == false) {
        image = '';
      } else {
        image = data[0]['image'];
      }
      nama = data[0]['name'];
      done = true;
    });
  }
}
