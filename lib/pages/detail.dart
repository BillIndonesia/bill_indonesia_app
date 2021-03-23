import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:bill/pages/resultVendorTopup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';

class Detail extends StatelessWidget {
  final String nohpResult;
  final String user_role;
  final String name;
  final String tipe;

  Detail({this.nohpResult, this.user_role, this.name, this.tipe});

  @override
  Widget build(BuildContext context) {
    return DetailPage(nohpResult, user_role, name, tipe);
  }
}

class DetailPage extends StatefulWidget {
  final String nohpTujuan;
  final String role;
  final String nm;
  final String tp;

  DetailPage(this.nohpTujuan, this.role, this.nm, this.tp);

  @override
  DetailPageState createState() => new DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  final _formKey = GlobalKey<FormState>();
  var namaTujuan = '';
  var login = '';
  var nohp = '';
  var pin = '';
  final jumlahController = TextEditingController();
  var image = '';
  Uint8List bytes;
  bool done = false;
  var user_role;

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) =>
        Scaffold(backgroundColor: Colors.white);

    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => new Home(usr: user_role)));
      },
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  child: FittedBox(
                      child: Text('Top Up & Pembayaran',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF423838))))),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color(0xFF777E81), size: 30),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => new Home(usr: user_role)));
                  }),
              backgroundColor: Color(0xFFF4F7F8),
              elevation: 0.0),
          backgroundColor: Color(0xFFF4F7F8),
          body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: Card(
                                      color: Color(0xFFE4F2FB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                          padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                          child: Column(children: <Widget>[
                                            done == true
                                                ? Expanded(
                                                    child: Container(
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                        Expanded(
                                                            flex: 2,
                                                            child: AspectRatio(
                                                                aspectRatio: 1,
                                                                child: Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.08,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.08,
                                                                    decoration: image !=
                                                                            ''
                                                                        ? BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            image: DecorationImage(fit: BoxFit.fill, image: MemoryImage(bytes)))
                                                                        : BoxDecoration(shape: BoxShape.circle),
                                                                    child: image == '' ? CircleAvatar(backgroundColor: Color(0xFF0485AC), child: Container(width: MediaQuery.of(context).size.width * 0.04, child: FittedBox(child: Text(namaTujuan != '' ? namaTujuan[0] : '', style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFFF4F7F8), fontSize: 20))))) : Container()))),
                                                        SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.006),
                                                        Expanded(
                                                            child: Container(
                                                                // color: Colors.red,
                                                                // width: MediaQuery.of(context).size.width * 0.25,
                                                                // height: MediaQuery.of(context).size.width * 0.007,
                                                                // color: Colors.red,
                                                                child: FittedBox(
                                                                    fit: BoxFit
                                                                        .fitWidth,
                                                                    child: Text(
                                                                        namaTujuan.split(' ')[
                                                                            0],
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color: Color(
                                                                                0xFF999494)),
                                                                        maxLines:
                                                                            1)))),
                                                        SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.006),
                                                        Expanded(
                                                            child: Container(
                                                                child: FittedBox(
                                                                    fit: BoxFit
                                                                        .fitWidth,
                                                                    child: Text(
                                                                        login,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12.0,
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            color: Color(0xFF6c6565))))))
                                                      ])))
                                                : Expanded(
                                                    child: Container(
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                        Expanded(
                                                            flex: 2,
                                                            child: AspectRatio(
                                                                aspectRatio: 1,
                                                                child: Shimmer.fromColors(
                                                                    baseColor:
                                                                        Colors.grey[
                                                                            300],
                                                                    highlightColor:
                                                                        Colors.grey[
                                                                            100],
                                                                    enabled:
                                                                        true,
                                                                    child: Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.08,
                                                                        height: MediaQuery.of(context).size.width *
                                                                            0.08,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            shape: BoxShape.circle))))),
                                                        Expanded(
                                                            child: SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.006)),
                                                        Expanded(
                                                            child: Shimmer.fromColors(
                                                                baseColor: Colors
                                                                    .grey[300],
                                                                highlightColor:
                                                                    Colors.grey[
                                                                        100],
                                                                enabled: true,
                                                                child: Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.2,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        color: Colors
                                                                            .white)))),
                                                        Expanded(
                                                            child: SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.006)),
                                                        Expanded(
                                                            child: Shimmer.fromColors(
                                                                baseColor: Colors
                                                                    .grey[300],
                                                                highlightColor:
                                                                    Colors.grey[
                                                                        100],
                                                                enabled: true,
                                                                child: Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.2,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        color: Colors
                                                                            .white))))
                                                      ])))
                                          ])))),
                              Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01,
                                    bottom: MediaQuery.of(context).size.height *
                                        0.01),
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: FittedBox(
                                              child: Text(
                                                  'Masukan / Pilih Nominal',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 13,
                                                      color: Color(0xFF999494),
                                                      fontWeight:
                                                          FontWeight.normal)))),
                                      Expanded(
                                          child: Container(
                                              alignment: Alignment.bottomCenter,
                                              // color: Colors.red,
                                              child: TextFormField(
                                                  focusNode:
                                                      AlwaysDisabledFocusNode(),
                                                  controller: jumlahController,
                                                  style: TextStyle(
                                                      color: Color(0xFF6c6565),
                                                      fontSize: 24.0,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  textAlign: TextAlign.left,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01),
                                                      suffix: IconButton(
                                                        icon: Icon(Icons.clear),
                                                        onPressed: () {
                                                          setState(() {
                                                            jumlahController
                                                                .text = '';
                                                          });
                                                        },
                                                      ),
                                                      hintText: 'Rp 0',
                                                      hintStyle:
                                                          TextStyle(
                                                              color: Color(
                                                                  0xFF6c6565),
                                                              fontSize: 24.0,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)))))
                                    ]),
                              )
                            ])),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                              child: Column(children: <Widget>[
                                Image(
                                    image: AssetImage('images/10.png'),
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: MediaQuery.of(context).size.width *
                                        0.15),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    child: FittedBox(
                                        child: Text('Rp 10.000',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 17.0))))
                              ]),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        10000)
                                    .toString();
                                MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                    amount: double.parse(sementara),
                                    settings: MoneyFormatterSettings(
                                      thousandSeparator: '.',
                                      decimalSeparator: ',',
                                    )).output;
                                setState(() {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                });
                              }),
                          GestureDetector(
                              child: Column(children: <Widget>[
                                Image(
                                    image: AssetImage('images/30.png'),
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: MediaQuery.of(context).size.width *
                                        0.15),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    child: FittedBox(
                                        child: Text('Rp 30.000',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 17.0))))
                              ]),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        30000)
                                    .toString();
                                MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                    amount: double.parse(sementara),
                                    settings: MoneyFormatterSettings(
                                      thousandSeparator: '.',
                                      decimalSeparator: ',',
                                    )).output;
                                setState(() {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                });
                              }),
                          GestureDetector(
                              child: Column(children: <Widget>[
                                Image(
                                    image: AssetImage('images/50.png'),
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: MediaQuery.of(context).size.width *
                                        0.15),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    child: FittedBox(
                                        child: Text('Rp 50.000',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 17.0))))
                              ]),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        50000)
                                    .toString();
                                MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                    amount: double.parse(sementara),
                                    settings: MoneyFormatterSettings(
                                      thousandSeparator: '.',
                                      decimalSeparator: ',',
                                    )).output;
                                setState(() {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                });
                              }),
                          GestureDetector(
                              child: Column(children: <Widget>[
                                Image(
                                    image: AssetImage('images/100.png'),
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: MediaQuery.of(context).size.width *
                                        0.15),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    child: FittedBox(
                                        child: Text('Rp 100.000',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 17.0))))
                              ]),
                              onTap: () {
                                if (jumlahController.text == '') {
                                  jumlahController.text = '0';
                                }
                                var sementara = (int.parse(jumlahController.text
                                            .replaceAll('.', '')) +
                                        100000)
                                    .toString();
                                MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                    amount: double.parse(sementara),
                                    settings: MoneyFormatterSettings(
                                      thousandSeparator: '.',
                                      decimalSeparator: ',',
                                    )).output;
                                setState(() {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                });
                              }),
                        ]),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                    Container(
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.07,
                            left: MediaQuery.of(context).size.width * 0.07),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Color(0xFF0485AC), Color(0xFF36B8B6)],
                            )),
                        child: Column(children: <Widget>[
                          //1 -3
                          Row(children: <Widget>[
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        // color: Colors.red,
                                        // width: MediaQuery.of(context).size.width * 0.01,
                                        alignment: Alignment.center,
                                        child: Text('1',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '1';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                }),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.083,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF116778),
                                            width: 1.0)))),
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        // color: Colors.red,
                                        // width: MediaQuery.of(context).size.width * 0.01,
                                        alignment: Alignment.center,
                                        child: Text('2',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '2';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                }),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.083,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF116778),
                                            width: 1.0)))),
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        // color: Colors.red,
                                        // width: MediaQuery.of(context).size.width * 0.01,
                                        alignment: Alignment.center,
                                        child: Text('3',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '3';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                })
                          ]),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Color(0xFF116778),
                                          width: 1.0)))),
                          //4-6
                          Row(children: <Widget>[
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        // color: Colors.red,
                                        // width: MediaQuery.of(context).size.width * 0.01,
                                        alignment: Alignment.center,
                                        child: Text('4',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '4';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                }),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.083,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF116778),
                                            width: 1.0)))),
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        // color: Colors.red,
                                        // width: MediaQuery.of(context).size.width * 0.01,
                                        alignment: Alignment.center,
                                        child: Text('5',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '5';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                }),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.083,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF116778),
                                            width: 1.0)))),
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        // color: Colors.red,
                                        // width: MediaQuery.of(context).size.width * 0.01,
                                        alignment: Alignment.center,
                                        child: Text('6',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '6';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                })
                          ]),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Color(0xFF116778),
                                          width: 1.0)))),
                          //7-9
                          Row(children: <Widget>[
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        // color: Colors.red,
                                        // width: MediaQuery.of(context).size.width * 0.01,
                                        alignment: Alignment.center,
                                        child: Text('7',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '7';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                }),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.083,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF116778),
                                            width: 1.0)))),
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text('8',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '8';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                }),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.083,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF116778),
                                            width: 1.0)))),
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text('9',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '9';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                })
                          ]),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Color(0xFF116778),
                                          width: 1.0)))),
                          Row(children: <Widget>[
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text('0',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 13) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '0';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                }),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.083,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF116778),
                                            width: 1.0)))),
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Text('000',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFF4F7F8),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center))),
                                onTap: () {
                                  if (jumlahController.text.length >= 10) {
                                  } else {
                                    var sementara = jumlahController.text
                                            .replaceAll('.', '') +
                                        '000';
                                    MoneyFormatterOutput fo =
                                        FlutterMoneyFormatter(
                                            amount: double.parse(sementara),
                                            settings: MoneyFormatterSettings(
                                              thousandSeparator: '.',
                                              decimalSeparator: ',',
                                            )).output;
                                    setState(() {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    });
                                  }
                                }),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.083,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            color: Color(0xFF116778),
                                            width: 1.0)))),
                            GestureDetector(
                                child: Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.of(context).size.width *
                                        0.255,
                                    height: MediaQuery.of(context).size.height *
                                        0.070,
                                    child: Icon(Icons.arrow_back,
                                        color: Color(0xFFF4F7F8),
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.07)),
                                onTap: () {
                                  var replace =
                                      jumlahController.text.replaceAll('.', '');
                                  var sementara =
                                      replace.substring(0, replace.length - 1);
                                  MoneyFormatterOutput fo;
                                  if (sementara != '') {
                                    fo = FlutterMoneyFormatter(
                                        amount: double.parse(sementara),
                                        settings: MoneyFormatterSettings(
                                          thousandSeparator: '.',
                                          decimalSeparator: ',',
                                        )).output;
                                  }
                                  setState(() {
                                    if (sementara != '') {
                                      jumlahController.text =
                                          fo.withoutFractionDigits.toString();
                                    } else {
                                      jumlahController.text = sementara;
                                    }
                                  });
                                })
                          ])
                        ])),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    (jumlahController.text != '') && (int.parse(jumlahController.text.replaceAll('.', '')) + 1) != 1
                        ? widget.role == 'vendor'
                            ? Visibility(
                                visible: (int.parse(jumlahController.text.replaceAll('.', '')) + 1) != 1
                                    ? true
                                    : false,
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: FittedBox(
                                        child: Text('Pilih jenis Transaksi',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 13,
                                                color: Color(0xFF999494),
                                                fontWeight:
                                                    FontWeight.normal)))))
                            : Visibility(
                                visible: (int.parse(jumlahController.text.replaceAll('.', '')) + 1) != 1
                                    ? true
                                    : false,
                                child: Text('', style: TextStyle(fontFamily: 'Montserrat', fontSize: 13, color: Color(0xFF999494), fontWeight: FontWeight.normal)))
                        : Text('', style: TextStyle(fontFamily: 'Montserrat', fontSize: 13, color: Color(0xFF999494), fontWeight: FontWeight.normal)),
                    Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.05,
                            bottom: MediaQuery.of(context).size.height * 0.02),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              jumlahController.text != '' &&
                                      (int.parse(jumlahController.text.replaceAll('.', '')) + 1) !=
                                          1
                                  ? widget.role == 'user'
                                      ? Visibility(
                                          visible: (int.parse(jumlahController.text.replaceAll('.', '')) + 1) != 1
                                              ? true
                                              : false,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color(0xFF0B8CAD),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              width: MediaQuery.of(context).size.width *
                                                  0.7,
                                              height: MediaQuery.of(context).size.height *
                                                  0.07,
                                              child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                onPressed: () {
                                                  kirim();
                                                  return showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Material(
                                                            type: MaterialType
                                                                .transparency);
                                                      });
                                                },
                                                color: Color(0xFFF4F7F8),
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.38,
                                                    child: FittedBox(
                                                        child: Text(
                                                            'Transfer Sekarang',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF0B8CAD),
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)))),
                                              )))
                                      : Visibility(
                                          visible: ((int.parse(jumlahController.text.replaceAll('.', '')) + 1) != 1)
                                              ? true
                                              : false,
                                          child: Row(
                                              mainAxisAlignment:
                                                  widget.tp == 'fixed'
                                                      ? MainAxisAlignment.center
                                                      : MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xFF0B8CAD),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.07,
                                                    child: RaisedButton(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      onPressed: () {
                                                        if (int.parse(
                                                                jumlahController
                                                                    .text
                                                                    .replaceAll(
                                                                        '.',
                                                                        '')) <=
                                                            100000) {
                                                          MoneyFormatterOutput
                                                              fo =
                                                              FlutterMoneyFormatter(
                                                                  amount: double.parse(
                                                                      jumlahController
                                                                          .text
                                                                          .replaceAll(
                                                                              '.',
                                                                              '')),
                                                                  settings:
                                                                      MoneyFormatterSettings(
                                                                    thousandSeparator:
                                                                        '.',
                                                                    decimalSeparator:
                                                                        ',',
                                                                  )).output;
                                                          return showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Dialog(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0)),
                                                                    child: Container(
                                                                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.width * 0.06),
                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFF4F7F8)),
                                                                        width: MediaQuery.of(context).size.width * 0.75,
                                                                        height: MediaQuery.of(context).size.height * 0.25,
                                                                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                                                                          Container(
                                                                              // color: Colors.green,
                                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                                              child: FittedBox(
                                                                                  child: RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: new TextSpan(
                                                                                  style: TextStyle(fontSize: 14.0, color: Color(0xFF999494), fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
                                                                                  children: <TextSpan>[
                                                                                    new TextSpan(text: 'Anda akan melakukan Top Up\n'),
                                                                                    new TextSpan(text: 'Sebesar Rp ${fo.withoutFractionDigits} kepada $namaTujuan'),
                                                                                  ],
                                                                                ),
                                                                              ))),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: <Widget>[
                                                                                FlatButton(
                                                                                    child: Container(width: MediaQuery.of(context).size.width * 0.08, child: FittedBox(child: Text('Oke', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF0B8CAD))))),
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context, false);
                                                                                      topup();
                                                                                      return showDialog(
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return Material(type: MaterialType.transparency);
                                                                                          });
                                                                                    }),
                                                                                FlatButton(
                                                                                    child: Container(width: MediaQuery.of(context).size.width * 0.13, child: FittedBox(child: Text('Cancel', style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF999494))))),
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context, false);
                                                                                    })
                                                                              ])
                                                                        ])));
                                                              });
                                                        } else {
                                                          return showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Dialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  child: Container(
                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFFF4F7F8)),
                                                                      height: MediaQuery.of(context).size.height * 0.22,
                                                                      width: MediaQuery.of(context).size.width * 0.75,
                                                                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: MediaQuery.of(context).size.width * 0.06),
                                                                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                                                                        Container(
                                                                            child:
                                                                                Column(children: <Widget>[
                                                                          Container(
                                                                              width: MediaQuery.of(context).size.width * 0.6,
                                                                              child: FittedBox(
                                                                                  child: RichText(
                                                                                textAlign: TextAlign.center,
                                                                                text: new TextSpan(
                                                                                  style: TextStyle(fontSize: 14.0, color: Color(0xFF999494), fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
                                                                                  children: <TextSpan>[
                                                                                    new TextSpan(text: 'Minimal satu kali Top Up adalah \n'),
                                                                                    new TextSpan(text: 'Sebesar Rp 100.000'),
                                                                                  ],
                                                                                ),
                                                                              )))
                                                                        ])),
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.centerRight,
                                                                            child: FlatButton(
                                                                              child: new Text('Oke', style: TextStyle(fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xFF0B8CAD))),
                                                                              onPressed: () {
                                                                                Navigator.pop(context, false);
                                                                              },
                                                                            ))
                                                                      ])),
                                                                );
                                                              });
                                                        }
                                                      },
                                                      color: Color(0xFFF4F7F8),
                                                      child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.14,
                                                          child: FittedBox(
                                                              child: Text(
                                                                  'Top Up',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xFF0B8CAD),
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      fontSize:
                                                                          17.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)))),
                                                    )),
                                                widget.tp != 'fixed'
                                                    ? SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.05)
                                                    : Container(),
                                                widget.tp != 'fixed'
                                                    ? Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xFF0B8CAD),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10)),
                                                        width:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .width *
                                                                0.4,
                                                        height:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                0.07,
                                                        margin: EdgeInsets.only(
                                                            right: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.01),
                                                        child: RaisedButton(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          onPressed: () {
                                                            penagihan();
                                                          },
                                                          color:
                                                              Color(0xFFF4F7F8),
                                                          child: Container(
                                                              width: MediaQuery
                                                                          .of(
                                                                              context)
                                                                      .size
                                                                      .width *
                                                                  0.25,
                                                              child: FittedBox(
                                                                  child: Text(
                                                                      'Pembayaran',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xFF0B8CAD),
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          fontSize:
                                                                              17.0,
                                                                          fontWeight:
                                                                              FontWeight.bold)))),
                                                        ))
                                                    : Container()
                                              ]))
                                  : widget.role == 'vendor'
                                      ? Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.075)
                                      : Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07)
                            ]))
                  ],
                ),
              ))),
    );
  }

  void getResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
      user_role = prefs.getString('user_role');
    });

    var url = 'https://bill.co.id/getNama';
    final response = await http.post(url,
        body: {'username': nohp, 'password': pin, 'result': widget.nohpTujuan});

    List item = jsonDecode(response.body);

    setState(() {
      namaTujuan = item[0]['name'];
      login = item[0]['login'];
      if (item[0]['image'] == false) {
        image = '';
      } else {
        image = item[0]['image'];
      }
      bytes = base64.decode(image);
      done = true;
    });
  }

  @override
  void initState() {
    // jumlahController.addListener(onChange);
    this.getResult();
  }

  // void onChange() {
  //   print('masuk');
  // }

  void kirim() async {
    var urlCreateJournal = 'https://bill.co.id/createJournal';
    final responseCreateJournal = await http.post(urlCreateJournal, body: {
      'username': nohp,
      'password': pin,
      'result': widget.nohpTujuan,
      'amount': jumlahController.text.replaceAll('.', '')
    });

    Navigator.of(context, rootNavigator: true).pop();

    if (responseCreateJournal.statusCode == 200) {
      if (responseCreateJournal.body == 'berhasil') {
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return WillPopScope(
                  onWillPop: () {},
                  child: Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                              vertical:
                                  MediaQuery.of(context).size.width * 0.04),
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFF4F7F8)),
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Text('Transaksi Berhasil',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: Color(0xFF999494)),
                                            textAlign: TextAlign.center))),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      FlatButton(
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                              child: FittedBox(
                                                  child: Text('Oke',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color(
                                                              0xFF0B8CAD))))),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            new Home(
                                                                usr:
                                                                    user_role)));
                                          })
                                    ])
                              ]))));
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
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: FittedBox(
                                child: Text('Saldo tidak mencukupi',
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

  void penagihan() async {
    var urlVendor = 'https://bill.co.id/scanVendor';
    final responseVendor = await http.post(urlVendor, body: {
      'username': nohp,
      'password': pin,
      'result': widget.nohpTujuan,
      'jumlah': jumlahController.text.replaceAll('.', ''),
      'name': widget.nm
    });

    if (responseVendor.statusCode == 200) {
      Future.delayed(const Duration(seconds: 15), () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var udah = prefs.getString('udah');
        var udah2 = prefs.getString('udah2');
        if (udah != 'udah' && udah2 != 'udah') {
          var urlKedaluwarsa = 'https://bill.co.id/kedaluwarsa';
          final responseKedaluwarsa = await http.post(urlKedaluwarsa, body: {
            'username': nohp,
            'password': pin,
            'result': widget.nohpTujuan,
            'name': widget.nm
          });
          Navigator.of(context, rootNavigator: true).pop();
          return showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                            vertical: MediaQuery.of(context).size.width * 0.06),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF4F7F8)),
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Center(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: FittedBox(
                                  child: Text('Tidak Ada Respon dari pelanggan',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Color(0xFF999494)),
                                      textAlign: TextAlign.center))),
                        )));
              });
        } else {
          prefs.setString('udah', 'belum');
        }
      });
      return showDialog(
          context: context,
          builder: (context) {
            return Material(
                type: MaterialType.transparency,
                child: WillPopScope(
                    onWillPop: () {},
                    child: Stack(children: <Widget>[
                      new Opacity(
                        opacity: 0.3,
                        child: const ModalBarrier(
                            dismissible: false, color: Color(0xFF000000)),
                      ),
                      new Center(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: FittedBox(
                                  child: Text('Menunggu konfirmasi pelanggan',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Color(0xFFF4F7F8),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)))))
                    ])));
          });
    } else {
      return showDialog(
          context: context,
          builder: (context) {
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
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
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

  void topup() async {
    var urlSales = 'https://bill.co.id/scanSales';
    final responseSales = await http.post(urlSales, body: {
      'username': nohp,
      'password': pin,
      'result': widget.nohpTujuan,
      'jumlah': jumlahController.text.replaceAll('.', '')
    });

    Navigator.of(context, rootNavigator: true).pop();

    if (responseSales.body == 'berhasil') {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => ResultVendorTopup(
              name: namaTujuan,
              image: image,
              jumlah: jumlahController.text.replaceAll('.', ''),
              result: 'Berhasil')));
    } else if (responseSales.body == 'gagal') {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => ResultVendorTopup(
              name: namaTujuan,
              image: image,
              jumlah: jumlahController.text.replaceAll('.', ''),
              result: 'Gagal')));
    } else if (responseSales.statusCode != 200) {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => ResultVendorTopup(
              name: namaTujuan,
              image: image,
              jumlah: jumlahController.text.replaceAll('.', ''),
              result: 'Gagal')));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
