import 'package:bill/pages/HomePages/Widgets/VendorQRCamera.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:bill/pages/detail.dart';
import 'package:bill/pages/saya.dart';
import 'package:bill/pages/riwayat.dart';
import 'package:bill/pages/topup.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:camera/camera.dart';
// import 'package:loading/loading.dart';
// import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:bill/pages/resultUserTopup.dart';

import 'User Transaction Pages/PayKWK.dart';

class Home extends StatelessWidget {
  final String usr;
  Home({this.usr});
  @override
  Widget build(BuildContext context) {
    return HomePage(usr);
  }
}

class HomePage extends StatefulWidget {
  final String user_role;
  HomePage(this.user_role);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  AppLifecycleState _notification;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey();
  String barcodes = "";
  var vendorType = '';
  var nohp = "";
  var pin = "";
  var name = '';
  var amount_gl = '';
  var amount_gl1 = '';
  // var user_role = '';
  List dataJournal;
  var scanned = false;
  var image = '';
  bool done = false;
  bool _activateCamera = false;

  final _scanKey = GlobalKey<CameraMlVisionState>();
  BarcodeDetector detector = FirebaseVision.instance.barcodeDetector();
  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<Null> openDialog() async {
    switch (await showDialog(
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
                  height: MediaQuery.of(context).size.height * 0.25,
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
                                      text: 'Anda yakin akan keluar\n'),
                                  new TextSpan(text: 'dari aplikasi ?'),
                                ],
                              ),
                            ))),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.06,
                                      child: FittedBox(
                                          child: Text('Iya',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF999494))))),
                                  onPressed: () {
                                    exit(0);
                                  }),
                              FlatButton(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      child: FittedBox(
                                          child: Text('Tidak',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF0B8CAD))))),
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  })
                            ]),
                      ])));
        })) {
      case 1:
        exit(0);
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = base64.decode(image);
    final appbar = Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: new BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xFF0485AC), Color(0xFF36B8B6)],
        )),
        child: Container(child: Image.asset('images/textbill.png')));
    final giphy = Container(
      width: MediaQuery.of(context).size.width * 0.68,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Image(
        image: AssetImage(
          'images/bingkai.png',
        ),
      ),
    );
    final saldoVendor = Expanded(
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
          done == true
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => new Riwayat(
                            tipe: 'filter',
                            awal: '',
                            akhir: '',
                            topup: 'true',
                            pembayaran: 'false',
                            debit: 'false',
                            kredit: 'false')));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Card(
                      color: Color(0xFFF9F9FB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.03,
                          vertical: MediaQuery.of(context).size.width * 0.05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Top Up',
                                          style: TextStyle(
                                            color: Color(0xFF999494),
                                            fontFamily: 'Montserrat',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      // color: Colors.red,
                                      width: MediaQuery.of(context).size.width *
                                          0.06,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.06,
                                      child: Image.asset(
                                        'images/icon top up.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02)),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          'Rp ',
                                          style: TextStyle(
                                            color: Color(0xFF999494),
                                            fontFamily: 'Montserrat',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      // color: Colors.red,
                                      alignment: Alignment.centerLeft,
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Text(
                                          amount_gl1 == '-0' ? '0' : amount_gl1,
                                          style: TextStyle(
                                            color: Color(0xFF6A6767),
                                            fontFamily: 'Montserrat',
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.02,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          top: BorderSide(
                                            color: Color(
                                              0xFF3AB673,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.2)),
          done == true
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => new Riwayat(
                            tipe: 'filter',
                            awal: '',
                            akhir: '',
                            topup: 'false',
                            pembayaran: 'true',
                            debit: 'false',
                            kredit: 'false')));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Card(
                          color: Color(0xFFF9F9FB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3.0,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.03,
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text('Pembayaran',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF999494),
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))))),
                                          Expanded(
                                              child: Container(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  // color: Colors.red,
                                                  // color: Colors.red,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06,
                                                  child: Image.asset(
                                                      'images/icon pembayaran.png'))),
                                        ])),
                                    Expanded(
                                        child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02)),
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                          Expanded(
                                              child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text('Rp ',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF999494),
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)))))
                                        ])),
                                    Expanded(
                                        flex: 2,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                  child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                              amount_gl == '-0'
                                                                  ? '0'
                                                                  : amount_gl,
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xFF6A6767),
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)))))
                                            ])),
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                          Expanded(
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.02,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              color: Color(
                                                                  0xFFFFBA35),
                                                              width: 2.0)))))
                                        ]))
                                  ])))))
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.2))
        ])));
    final namaVendor = Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          done == true
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => new Saya()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 8.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xFF0485AC), Color(0xFF36B8B6)],
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Profile Info
                          Row(
                            children: <Widget>[
                              Container(
                                // color: Colors.red,
                                margin: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05,
                                  // vertical: MediaQuery.of(context).size.height * 0.007
                                ),
                                // width: MediaQuery.of(context).size.width * 0.08,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Container(
                                    // height: MediaQuery.of(context).size.width * 0.08,
                                    decoration: image != ''
                                        ? BoxDecoration(
                                            // color: Colors.red,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: MemoryImage(bytes)))
                                        : BoxDecoration(shape: BoxShape.circle),
                                    child: image == ''
                                        ? CircleAvatar(
                                            backgroundColor: Color(0xFF0485AC),
                                            child: Center(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.035,
                                                child: FittedBox(
                                                  child: Text(
                                                    name != '' ? name[0] : '',
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFF4F7F8),
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.003,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        'Halo,',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFFF4F7F8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.001),
                                  Expanded(
                                    flex: 2,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        name.split(' ')[0],
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFF4F7F8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.003,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //Role
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.007,
                            ),
                            // width: MediaQuery.of(context).size.width * 0.08,
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                vendorType == 'fixed' ? 'KWK' : 'Warung',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w100,
                                  color: Color(0xFFF4F7F8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
        ],
      ),
    );
    final camera = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        done == true
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.43,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (controller) {
                    controller.scannedDataStream.listen((value) {
                      setState(() {
                        print(value);
                        barcodes = value;
                      });
                      controller?.pauseCamera();
                      scanBarcode(barcodes);

                      //harap tunggu
                      return showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return Material(
                                type: MaterialType.transparency,
                                child: WillPopScope(
                                  onWillPop: () {},
                                  child: Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    backgroundColor: Colors.white,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.005,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Colors.white10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text('Harap tunggu'),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.005,
                                          ),
                                          CircularProgressIndicator(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          });
                    });
                  },
                ),
              )
            : Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: true,
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: widget.user_role == 'vendor'
                      ? MediaQuery.of(context).size.height * 0.6
                      : MediaQuery.of(context).size.height * 0.43,
                  color: Colors.white,
                ),
              ),
      ],
    );
    final namaUser = Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.007),
        width: MediaQuery.of(context).size.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <
            Widget>[
          done == true
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => new Saya()));
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 8.0,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [Color(0xFF0485AC), Color(0xFF36B8B6)],
                              )),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width *
                                            0.04,
                                        right: MediaQuery.of(context).size.width *
                                            0.04),
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    height: MediaQuery.of(context).size.width *
                                        0.08,
                                    decoration: image != ''
                                        ? BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: MemoryImage(bytes)))
                                        : BoxDecoration(shape: BoxShape.circle),
                                    child: image == ''
                                        ? CircleAvatar(
                                            backgroundColor: Color(0xFF0485AC),
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.035,
                                                child: FittedBox(
                                                    child: Text(name != '' ? name[0] : '', style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFFF4F7F8), fontSize: 20)))))
                                        : Container()),
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                          child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.003)),
                                      Expanded(
                                          flex: 2,
                                          child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text('Halo,',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      // fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          Color(0xFFF4F7F8))))),
                                      Expanded(
                                          flex: 2,
                                          child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(name.split(' ')[0],
                                                  style: TextStyle(
                                                      // fontSize: 16.0,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Color(0xFFF4F7F8))))),
                                      Expanded(
                                          child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.003)),
                                    ])
                              ]))))
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)))),
          done == true
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => new Riwayat()));
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 8.0,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.07,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                colors: [Color(0xFF0485AC), Color(0xFF36B8B6)],
                              )),
                          child: Container(
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                      amount_gl == '-0'
                                          ? 'Rp 0'
                                          : 'Rp ' + amount_gl,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          // fontSize: 22,
                                          color: Color(0xFFF4F7F8)))))
                          // Align(
                          //     alignment: Alignment.center,
                          //     child:Container(
                          //         width: MediaQuery.of(context).size.width * 0.3,
                          //         height: MediaQuery.of(context).size.height * 0.05,
                          //         color: Colors.red,
                          //         child: FittedBox(
                          //           fit: BoxFit.fitWidth,
                          //           child : Text('Rp ' + amount_gl,
                          //           style: TextStyle(
                          //               fontFamily: 'Montserrat',
                          //               fontWeight: FontWeight.bold,
                          //               // fontSize: 22,
                          // color: Color(0xFFF4F7F8))))))
                          )))
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: true,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)))),
        ]));
    final qrcode = GestureDetector(
        onTap: () {
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => new TopUp()));
        },
        child: Container(
            // color: Colors.yellow,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.width * 0.007),
            child: QrImage(
              gapless: false,
              // embeddedImage: AssetImage('images/textbillbiru.png'),
              // embeddedImageStyle: QrEmbeddedImageStyle(
              //   size: Size(50, 50),
              //   color: Colors.black),
              // foregroundColor: Color(0xFF0B8CAD),
              data: nohp,
              size: MediaQuery.of(context).size.width * 0.39,
              version: 3,
            )));

    //home vendor
    if (widget.user_role == 'vendor') {
      return WillPopScope(
          onWillPop: onBackPress,
          child: Scaffold(
            backgroundColor: Color(0xFFF4F7F8),
            body: Column(
              children: <Widget>[
                appbar,
                done == true
                    ? _activateCamera == false
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.43,
                            child: GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    vendorType == 'flexible'
                                        ? _activateCamera = true
                                        : _activateCamera = false;
                                  },
                                );
                              },
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                      alignment: Alignment.center,
                                      child: qrcode),
                                  Align(
                                    alignment: Alignment.center,
                                    child: giphy,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Stack(
                            children: [
                              camera,
                              IconButton(
                                alignment: Alignment.bottomRight,
                                onPressed: () {
                                  setState(() {
                                    _activateCamera = false;
                                  });
                                },
                                icon: Icon(
                                  Icons.qr_code_scanner_rounded,
                                  size:
                                      MediaQuery.of(context).size.height * 0.08,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                    : Container(
                        child: Expanded(
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            enabled: true,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.03),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                namaVendor,
                saldoVendor,
              ],
            ),
          ));
    } else if (widget.user_role == 'user') {
      return WillPopScope(
        onWillPop: onBackPress,
        child: Scaffold(
          backgroundColor: Color(0xFFF4F7F8),
          body: Column(
            children: <Widget>[
              appbar,
              camera,
              namaUser,
              done == true
                  ? Expanded(
                      child: Container(
                          // color: Colors.red,
                          child: Stack(children: <Widget>[
                      Align(alignment: Alignment.center, child: qrcode),
                      Align(alignment: Alignment.center, child: giphy)
                    ])))
                  : Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        enabled: true,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.03),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    }
    // else {
    //   return WillPopScope(
    //     onWillPop: () {
    //       SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    //     },
    //     child: Scaffold(
    //     backgroundColor: Color(0xFFF4F7F8),
    //     body: Column(children: <Widget>[
    //       appbar,
    //       cont,
    //       namaUser,
    //       Expanded(
    //         child: Shimmer.fromColors(
    //           baseColor: Colors.grey[300],
    //           highlightColor: Colors.grey[100],
    //           enabled: true,
    //           child: Container(
    //             margin: EdgeInsets.symmetric(
    //               vertical: MediaQuery.of(context).size.height * 0.03),
    //             width: MediaQuery.of(context).size.width * 0.7,
    //             height: MediaQuery.of(context).size.height * 0.2,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(10)))))
    //       // Expanded(
    //       //   child: Container(
    //       //       // color: Colors.red,
    //       //       child: Stack(children: <Widget>[
    //       // Align(
    //       //   alignment: Alignment.center,
    //       //   child: giphy),
    //       // Align(
    //       //   alignment: Alignment.center,
    //       //   child: qrcode)
    //       // ])))
    //     ]),
    //   ));
    // }
  }

  void getSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
      vendorType = prefs.getString('vendor_type');
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    setState(() {
      scanned = false;
    });
    super.initState();
    this.getSignIn();
    this.getDataJournal();
  }

  void getDataJournal() async {
    var url = 'https://bill.co.id/getDataJournal';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _nohp = prefs.getString('nohp');
    var _pin = prefs.getString('pin');
    final response = await http.post(url, body: {
      'username': _nohp,
      'password': _pin,
    });

    // user_role = prefs.getString('user_role');

    setState(() {
      dataJournal = jsonDecode(response.body);
      name = dataJournal[0]['name'];
      // user_role = dataJournal[0]['user_role'];
      MoneyFormatterOutput fo = FlutterMoneyFormatter(
          amount: double.parse(dataJournal[0]['amount_gl']),
          settings: MoneyFormatterSettings(
            thousandSeparator: '.',
            decimalSeparator: ',',
          )).output;
      amount_gl = fo.withoutFractionDigits;
      if (dataJournal[0]['user_role'] == 'vendor') {
        MoneyFormatterOutput fo = FlutterMoneyFormatter(
            amount: double.parse(dataJournal[0]['amount_gl1']),
            settings: MoneyFormatterSettings(
              thousandSeparator: '.',
              decimalSeparator: ',',
            )).output;
        amount_gl1 = fo.withoutFractionDigits;
      }
      image = dataJournal[0]['image'];
      done = true;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // detector.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state.toString());
    setState(() {
      _notification = state;
    });
  }

  void scanBarcode(barcodes) async {
    //User Scan Voucher UseCase
    if (barcodes.substring(0, 1) == '#' && widget.user_role == 'user') {
      var url = 'https://bill.co.id/scanVoucher';
      final response = await http.post(url, body: {
        'username': nohp,
        'password': pin,
        'voucher_code': barcodes.replaceAll('#', ''),
      });
      setState(() {
        _activateCamera = false;
      });
      if (jsonDecode(response.body)[0]["result"] == 'berhasil') {
        print('berhasil');
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultUserTopup(
                      jumlah: jsonDecode(response.body)[0]["jumlah"].toString(),
                      res: jsonDecode(response.body)[0]["result"],
                      kembali: 0.toString(),
                      type: "voucher",
                    )));
      } else if (jsonDecode(response.body)[0]["result"] == 'tidak') {
        print('gagal');
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultUserTopup(
                      jumlah: 0.toString(),
                      res: jsonDecode(response.body)[0]["result"],
                      kembali: 0.toString(),
                      type: "voucher",
                    )));
      } else {
        Navigator.of(context, rootNavigator: true).pop();
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
                          width: MediaQuery.of(context).size.width * 0.65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFF4F7F8)),
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: FittedBox(
                                        child: Text('Kesalahan Server',
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
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            Navigator.of(context).pushReplacement(
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        new Home(
                                                            usr: widget
                                                                .user_role)));
                                          })
                                    ])
                              ]))));
            });
      }
    }
    //Transaction
    else {
      //find number API
      var url = 'https://bill.co.id/searchNotelp';
      final response = await http.post(url, body: {
        'notelp': barcodes,
      });
      //searchNotelp API Succes
      if (response.statusCode == 200) {
        //No telphone yang discan tidak terdaftar
        if (response.body == "Tidak" ||
            response.body == 'Admin' ||
            response.body == 'Vendor') {
          Navigator.of(context, rootNavigator: true).pop();
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
                                    MediaQuery.of(context).size.width * 0.06),
                            width: MediaQuery.of(context).size.width * 0.65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF4F7F8)),
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: FittedBox(
                                          child: Text('User tidak ditemukan',
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
                                              Navigator.of(context).pushReplacement(
                                                  new MaterialPageRoute(
                                                      builder: (context) =>
                                                          new Home(
                                                              usr: widget
                                                                  .user_role)));
                                            })
                                      ])
                                ]))));
              });
        }
        //No telpon yang discan terdaftar
        else if (response.body == 'Iya') {
          //Vendor scan Usecase
          if (widget.user_role == 'vendor') {
            var urlCheckPrice = 'https://bill.co.id/getActive';
            final responseCheckPrice =
                await http.post(urlCheckPrice, body: {'nohp': nohp});
            if (jsonDecode(responseCheckPrice.body)[0]['vendor_price_type'] ==
                'fixed') {
              var price = jsonDecode(responseCheckPrice.body)[0]
                      ['vendor_fixed_price']
                  .toInt();
              // Navigator.of(context, rootNavigator: true).pop();
              penagihan(barcodes, price);
            } else {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (context) => new Detail(
                      nohpResult: barcodes, user_role: 'vendor', name: name)));
            }
          }
          //User scan Usecase
          else {
            //Get Nama Vendor API
            var urlNama = 'https://bill.co.id/getNama';
            final responseNama = await http.post(urlNama,
                body: {'username': nohp, 'password': pin, 'result': barcodes});
            var angkotName = jsonDecode(responseNama.body)[0]['name'];
            var angkotImage = jsonDecode(responseNama.body)[0]['image'];
            // IF yang di scan qr Angkot
            if (barcodes.contains('kwk') || barcodes.contains('KWK')) {
              print('angkot nihhhhhh');
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context).pushReplacement(
                new MaterialPageRoute(
                  builder: (context) => new PayKwk(
                    nohpResult: barcodes,
                    name: name,
                    noHpUser: nohp,
                    pinUser: pin,
                    angkotName: angkotName,
                    angkotImage: angkotImage,
                  ),
                ),
              );
            }
            // IF yang di scan qr Warung(flexible) or QR sesama user
            else {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.of(context).pushReplacement(
                new MaterialPageRoute(
                  builder: (context) => new Detail(
                    nohpResult: barcodes,
                    user_role: 'user',
                    name: name,
                  ),
                ),
              );
            }
          }
        }
        //Suspended User
        else {
          Navigator.of(context, rootNavigator: true).pop();
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
                                    MediaQuery.of(context).size.width * 0.06),
                            width: MediaQuery.of(context).size.width * 0.65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF4F7F8)),
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: FittedBox(
                                          child: Text('User sedang disuspend',
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
                                              Navigator.of(context).pushReplacement(
                                                  new MaterialPageRoute(
                                                      builder: (context) =>
                                                          new Home(
                                                              usr: widget
                                                                  .user_role)));
                                            })
                                      ])
                                ]))));
              });
        }
      }
      //searchNotelp API fail
      else {
        Navigator.of(context, rootNavigator: true).pop();
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
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF4F7F8)),
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: FittedBox(
                          child: Text(
                            'Kesalahan Server',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF999494),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.08,
                                child: FittedBox(
                                  child: Text(
                                    'Oke',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(
                                        0xFF0B8CAD,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                Navigator.of(context).pushReplacement(
                                  new MaterialPageRoute(
                                    builder: (context) => new Home(
                                      usr: widget.user_role,
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    }
  }

  void penagihan(barcodes, jumlah) async {
    print('masuk penagihan');
    // Navigator.of(context, rootNavigator: true).pop();
    var urlVendor = 'https://bill.co.id/scanVendor';
    final responseVendor = await http.post(urlVendor, body: {
      'username': nohp,
      'password': pin,
      'result': barcodes,
      'jumlah': jumlah.toString(),
      'name': name
    });

    if (responseVendor.statusCode == 200) {
      Navigator.of(context, rootNavigator: true).pop();
      // print('masuk penagihan 2');
      Future.delayed(const Duration(seconds: 15), () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var udah = prefs.getString('udah');
        var udah2 = prefs.getString('udah2');
        if (udah != 'udah' && udah2 != 'udah') {
          var urlKedaluwarsa = 'https://bill.co.id/kedaluwarsa';
          final responseKedaluwarsa = await http.post(urlKedaluwarsa, body: {
            'username': nohp,
            'password': pin,
            'result': barcodes,
            'name': name
          });
          Navigator.of(context, rootNavigator: true).pop();
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
                                    MediaQuery.of(context).size.width * 0.06),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFF4F7F8)),
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: FittedBox(
                                          child: Text(
                                              'Tidak Ada Respon dari pelanggan',
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
                                              Navigator.of(context).pushReplacement(
                                                  new MaterialPageRoute(
                                                      builder: (context) =>
                                                          new Home(
                                                              usr: widget
                                                                  .user_role)));
                                            })
                                      ])
                                ]))));
              });
        } else {
          prefs.setString('udah', 'belum');
        }
      });
      return showDialog(
          barrierDismissible: false,
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
      Navigator.of(context, rootNavigator: true).pop();
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
                            vertical: MediaQuery.of(context).size.width * 0.06),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF4F7F8)),
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: FittedBox(
                                      child: Text('Kesalahan Server',
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
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.of(context).pushReplacement(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Home(
                                                          usr: widget
                                                              .user_role)));
                                        })
                                  ])
                            ]))));
          });
    }
  }

  void kirim(barcodes, jumlah) async {
    print('masuk penagihan');
    // Navigator.of(context, rootNavigator: true).pop();
    // var urlCreateJournal = 'https://bill.co.id/createJournal';
    // final responseCreateJournal = await http.post(urlCreateJournal, body: {
    //   'username': nohp,
    //   'password': pin,
    //   'result': barcodes.first.displayValue,
    //   'amount': jumlah.toString()
    // });
    MoneyFormatterOutput fo = FlutterMoneyFormatter(
        amount: double.parse(jumlah.toString()),
        settings: MoneyFormatterSettings(
          thousandSeparator: '.',
          decimalSeparator: ',',
        )).output;

    var urlNama = 'https://bill.co.id/getNama';
    final responseNama = await http.post(urlNama,
        body: {'username': nohp, 'password': pin, 'result': barcodes});
    var angkotName = jsonDecode(responseNama.body)[0]['name'];
    Navigator.of(context, rootNavigator: true).pop();

    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return WillPopScope(
              onWillPop: () {},
              child: Dialog(
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
                      height: MediaQuery.of(context).size.height * 0.23,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                // color: Colors.green,
                                width: MediaQuery.of(context).size.width * 0.6,
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
                                              'Anda akan melakukan pembayaran\n'),
                                      new TextSpan(
                                          text:
                                              'Sebesar Rp ${fo.withoutFractionDigits} kepada ${jsonDecode(responseNama.body)[0]['name']}'),
                                    ],
                                  ),
                                ))),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Color(0xFF0B8CAD))))),
                                      onPressed: () {
                                        // Navigator.pop(
                                        //     context, false);
                                        resultTransac(
                                            'Berhasil',
                                            jsonDecode(responseNama.body)[0]
                                                ['name'],
                                            jumlah.toString());
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      }),
                                  FlatButton(
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: FittedBox(
                                              child: Text('Tidak',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Color(0xFF999494))))),
                                      onPressed: () {
                                        // Navigator.pop(
                                        //     context, false);
                                        resultTransac(
                                            'Gagal',
                                            jsonDecode(responseNama.body)[0]
                                                ['name'],
                                            jumlah.toString());
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      })
                                ])
                          ]))));
        });
  }

  void resultTransac(result, nm, jml) async {
    var urlTransac = 'https://bill.co.id/resultTransac';
    final responseTransac = await http.post(urlTransac, body: {
      'username': nohp,
      'password': pin,
      'result': result,
      'desti': nm,
      'jumlah': jml
    });

    if (responseTransac.statusCode == 200) {
    } else {
      // Navigator.of(context, rootNavigator: true).pop();
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
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF4F7F8)),
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: FittedBox(
                                      child: Text('Kesalahan Server',
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
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                          Navigator.of(context).pushReplacement(
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Home(
                                                          usr: widget
                                                              .user_role)));
                                        })
                                  ])
                            ]))));
          });
    }
  }
}
