import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:bill/pages/riwayat.dart';
import 'package:bill/pages/home.dart';
import 'package:bill/pages/detail.dart';
import 'package:bill/pages/resultVendor.dart';
import 'package:bill/pages/resultUser.dart';
import 'package:bill/pages/resultUserTopup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class FirebaseNotifications {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void setUpFirebase(navigatorKey) {
    firebaseCloudMessaging_Listeners(navigatorKey);
  }

  void getToken() {
    if (Platform.isIOS) iOS_Permission();
    
    _firebaseMessaging.getToken().then((token) async {
      print(token);
      var url = 'https://bill.co.id/saveToken';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var _nohp = prefs.getString('nohp');
      var _pin = prefs.getString('pin');
      final response = await http.post(url,
          body: {
          'username': _nohp, 
          'password': _pin, 
          'token': token
          });
    });
  }

  void deleteToken() async {
    var url = 'https://bill.co.id/deleteToken';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _nohp = prefs.getString('nohp');
    var _pin = prefs.getString('pin');
    final response = await http.post(url, body: {
      'username': _nohp,
      'password': _pin,
    });
  }

  void firebaseCloudMessaging_Listeners(navKey) {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');

        if (message['data']['notif'] == 'vendor') {
          MoneyFormatterOutput fo = FlutterMoneyFormatter(
              amount: double.parse(message['data']['jumlah']),
              settings: MoneyFormatterSettings(
                thousandSeparator: '.',
                decimalSeparator: ',',
              )).output;
          return showDialog(
              barrierDismissible: false,
              context: navKey.currentContext,
              builder: (_) {
                return WillPopScope(
                  onWillPop: () {

                    },
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(navKey.currentContext).size.width * 0.05,
                            vertical: MediaQuery.of(navKey.currentContext).size.width * 0.06),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF4F7F8)),
                        width: MediaQuery.of(navKey.currentContext).size.width * 0.7,
                        height: MediaQuery.of(navKey.currentContext).size.height * 0.23,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Container(
                            // color: Colors.green,
                            width: MediaQuery.of(navKey.currentContext).size.width * 0.6,
                            child: FittedBox(
                              child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF999494),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Anda akan melakukan pembayaran\n'),
                                  TextSpan(
                                      text: 'Sebesar Rp ${fo.withoutFractionDigits} kepada ${message['data']['name']}'),
                                ],
                              ),
                            ))),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FlatButton(
                                      child: Container(
                                      width: MediaQuery.of(navKey.currentContext).size.width * 0.08,
                                        child: FittedBox(
                                          child: Text('Oke',
                                            style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF0B8CAD))))),
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     navKey.currentContext, false);
                                          resultTransac(
                                              'Berhasil',
                                              message['data']['name'],
                                              message['data']['jumlah'],
                                              navKey);
                                          return showDialog(
                                          context: navKey.currentContext,
                                          builder: (_) {
                                            return Material(
                                                type: MaterialType.transparency);
                                          });
                                        }),
                                    FlatButton(
                                        child: Container(
                                        width: MediaQuery.of(navKey.currentContext).size.width * 0.1,
                                          child: FittedBox(
                                            child: Text('Tidak',
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF999494))))),
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     navKey.currentContext, false);
                                          resultTransac(
                                              'Gagal',
                                              message['data']['name'],
                                              message['data']['jumlah'],
                                              navKey);

                                          return showDialog(
                                          context: navKey.currentContext,
                                          builder: (_) {
                                            return Material(
                                                type: MaterialType.transparency);
                                          });
                                        })
                                  ])
                            ]))));
              });
        } else if (message['data']['notif'] == 'user') {
          MoneyFormatterOutput fo = FlutterMoneyFormatter(
              amount: double.parse(message['data']['jumlah']),
              settings: MoneyFormatterSettings(
                thousandSeparator: '.',
                decimalSeparator: ',',
              )).output;
          return showDialog(
              barrierDismissible: false,
              context: navKey.currentContext,
              builder: (_) {
                return WillPopScope(
                  onWillPop: () {

                    },
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(navKey.currentContext).size.width * 0.05,
                            vertical: MediaQuery.of(navKey.currentContext).size.width * 0.04),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF4F7F8)),
                        width: MediaQuery.of(navKey.currentContext).size.width * 0.7,
                        height: MediaQuery.of(navKey.currentContext).size.height * 0.2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                            Container(
                            // color: Colors.green,
                            width: MediaQuery.of(navKey.currentContext).size.width * 0.6,
                            child: FittedBox(
                              child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xFF999494),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Montserrat'),
                                children: <TextSpan>[
                                  TextSpan(text: 'Anda menerima uang dari ' + message['data']['nama'] + '\n'),
                                  TextSpan(text: 'Sebesar Rp ${fo.withoutFractionDigits}'),
                                ],
                              ),
                            ))),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    // FlatButton(
                                    //     child: Text('Lihat',
                                    //         style: TextStyle(
                                    //             fontFamily: 'Montserrat',
                                    //             fontSize: 16,
                                    //             fontWeight: FontWeight.w600,
                                    //             color: Color(0xFF0B8CAD))),
                                    //     onPressed: () {
                                    //       Navigator.push(navKey.currentContext,
                                    //         MaterialPageRoute(builder: (_) => Riwayat()));
                                    //     }),
                                    FlatButton(
                                        child: Container(
                                          width: MediaQuery.of(navKey.currentContext).size.width * 0.1,
                                          child: FittedBox(
                                            child: Text('Tutup',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF999494))))),
                                        onPressed: () {
                                          Navigator.push(navKey.currentContext,
                                            MaterialPageRoute(builder: (_) => Home()));
                                        })
                                  ])
                            ]))));
              });
        } else if (message['data']['notif'] == 'vendorResult') {
          // DetailPageState().cancel();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var udah = prefs.getString('udah');
          if (udah == 'udah') {
            print('masuk 1');
            prefs.setString('udah', 'udah');
            prefs.setString('udah2', 'udah');
            Future.delayed(const Duration(seconds: 15), () async {
                prefs.setString('udah2', 'belum');
            });
          } else {
            print('masuk 2');
            prefs.setString('udah', 'udah');
          }
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultVendor(
                      result: message['data']['result'],
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'])));
        } else if (message['data']['notif'] == 'topup') {
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultUserTopup(
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'],
                      res: message['data']['res'],
                      kembali: message['data']['kembali'])));
        } else if (message['data']['notif'] == 'userResult') {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setString('udah', 'udah');
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultUser(
                      result: message['data']['result'],
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'])));
        } else if (message['data']['notif'] == 'kedaluwarsa') {
          Navigator.of(navKey.currentContext, rootNavigator: true).pop();
          return showDialog(
            context: navKey.currentContext,
            builder: (_) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(navKey.currentContext).size.width * 0.05,
                          vertical: MediaQuery.of(navKey.currentContext).size.width * 0.06),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF4F7F8)),
                      width: MediaQuery.of(navKey.currentContext).size.width * 0.7,
                      height: MediaQuery.of(navKey.currentContext).size.height * 0.15,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(navKey.currentContext).size.width * 0.6,
                          child: FittedBox(
                            child: Text('Konfirmasi Transaksi telah kedaluwarsa',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF999494)),
                            textAlign: TextAlign.center))),
                      )));
            });
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');

        if (message['data']['notif'] == 'vendor') {
          MoneyFormatterOutput fo = FlutterMoneyFormatter(
              amount: double.parse(message['data']['jumlah']),
              settings: MoneyFormatterSettings(
                thousandSeparator: '.',
                decimalSeparator: ',',
              )).output;
          return showDialog(
              barrierDismissible: false,
              context: navKey.currentContext,
              builder: (_) {
                return WillPopScope(
                  onWillPop: () {

                    },
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(navKey.currentContext)
                                    .size
                                    .width *
                                0.05,
                            vertical: MediaQuery.of(navKey.currentContext)
                                    .size
                                    .width *
                                0.06),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF4F7F8)),
                        width: MediaQuery.of(navKey.currentContext).size.width * 0.7,
                        height: MediaQuery.of(navKey.currentContext).size.height * 0.23,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Container(
                            // color: Colors.green,
                            width: MediaQuery.of(navKey.currentContext).size.width * 0.6,
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
                                          'Sebesar Rp ${fo.withoutFractionDigits} kepada ${message['data']['name']}'),
                                ],
                              ),
                            ))),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FlatButton(
                                        child: Container(
                                    width: MediaQuery.of(navKey.currentContext).size.width * 0.08,
                                    child: FittedBox(
                                      child: Text('Oke',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0B8CAD))))),
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     navKey.currentContext, false);
                                          resultTransac(
                                              'Berhasil',
                                              message['data']['name'],
                                              message['data']['jumlah'],
                                              navKey);
                                          return showDialog(
                                          context: navKey.currentContext,
                                          builder: (_) {
                                            return Material(
                                                type: MaterialType.transparency);
                                          });
                                        }),
                                    FlatButton(
                                        child: Container(
                                    width: MediaQuery.of(navKey.currentContext).size.width * 0.1,
                                    child: FittedBox(
                                      child: Text('Tidak',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF999494))))),
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     navKey.currentContext, false);
                                          resultTransac(
                                              'Gagal',
                                              message['data']['name'],
                                              message['data']['jumlah'],
                                              navKey);
                                          return showDialog(
                                          context: navKey.currentContext,
                                          builder: (_) {
                                            return Material(
                                                type: MaterialType.transparency);
                                          });
                                        })
                                  ])
                            ]))));
              });
        } else if (message['data']['notif'] == 'user') {
          Navigator.push(navKey.currentContext,
              MaterialPageRoute(builder: (_) => Riwayat()));
        } else if (message['data']['notif'] == 'vendorResult') {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('udah', 'udah');
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultVendor(
                      result: message['data']['result'],
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'])));
        } else if (message['data']['notif'] == 'topup') {
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultUserTopup(
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'],
                      res: message['data']['res'],
                      kembali: message['data']['kembali'])));
        } else if (message['data']['notif'] == 'userResult') {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setString('udah', 'udah');
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultUser(
                      result: message['data']['result'],
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'])));
        } else if (message['data']['notif'] == 'kedaluwarsa') {
          return showDialog(
            context: navKey.currentContext,
            builder: (_) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(navKey.currentContext).size.width * 0.05,
                          vertical: MediaQuery.of(navKey.currentContext).size.width * 0.06),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF4F7F8)),
                      width: MediaQuery.of(navKey.currentContext).size.width * 0.7,
                      height: MediaQuery.of(navKey.currentContext).size.height * 0.15,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(navKey.currentContext).size.width * 0.6,
                          child: FittedBox(
                            child: Text('Konfirmasi Transaksi telah kedaluwarsa',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF999494)),
                            textAlign: TextAlign.center))),
                      )));
            });
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');

        if (message['data']['notif'] == 'vendor') {
          MoneyFormatterOutput fo = FlutterMoneyFormatter(
              amount: double.parse(message['data']['jumlah']),
              settings: MoneyFormatterSettings(
                thousandSeparator: '.',
                decimalSeparator: ',',
              )).output;
          return showDialog(
              barrierDismissible: false,
              context: navKey.currentContext,
              builder: (_) {
                return WillPopScope(
                  onWillPop: () {

                    },
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(navKey.currentContext).size.width * 0.05,
                            vertical: MediaQuery.of(navKey.currentContext)
                                    .size
                                    .width *
                                0.06),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFF4F7F8)),
                        width: MediaQuery.of(navKey.currentContext).size.width * 0.7,
                        height: MediaQuery.of(navKey.currentContext).size.height * 0.23,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Container(
                            // color: Colors.green,
                            width: MediaQuery.of(navKey.currentContext).size.width * 0.6,
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
                                          'Sebesar Rp ${fo.withoutFractionDigits} kepada ${message['data']['name']}'),
                                ],
                              ),
                            ))),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    FlatButton(
                                        child: Container(
                                    width: MediaQuery.of(navKey.currentContext).size.width * 0.08,
                                    child: FittedBox(
                                      child: Text('Oke',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0B8CAD))))),
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     navKey.currentContext, false);
                                          resultTransac(
                                              'Berhasil',
                                              message['data']['name'],
                                              message['data']['jumlah'],
                                              navKey);

                                          return showDialog(
                                          context: navKey.currentContext,
                                          builder: (_) {
                                            return Material(
                                                type: MaterialType.transparency);
                                          });
                                        }),
                                    FlatButton(
                                        child: Container(
                                    width: MediaQuery.of(navKey.currentContext).size.width * 0.1,
                                    child: FittedBox(
                                      child: Text('Tidak',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF999494))))),
                                        onPressed: () {
                                          // Navigator.pop(
                                          //     navKey.currentContext, false);
                                          resultTransac(
                                              'Gagal',
                                              message['data']['name'],
                                              message['data']['jumlah'],
                                              navKey);

                                          return showDialog(
                                          context: navKey.currentContext,
                                          builder: (_) {
                                            return Material(
                                                type: MaterialType.transparency);
                                          });
                                        })
                                  ])
                            ]))));
              });
        } else if (message['data']['notif'] == 'user') {
          Navigator.push(navKey.currentContext,
              MaterialPageRoute(builder: (_) => Riwayat()));
        } else if (message['data']['notif'] == 'vendorResult') {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('udah', 'udah');
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultVendor(
                      result: message['data']['result'],
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'])));
        } else if (message['data']['notif'] == 'topup') {
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultUserTopup(
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'],
                      res: message['data']['res'],
                      kembali: message['data']['kembali'])));
        } else if (message['data']['notif'] == 'userResult') {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // prefs.setString('udah', 'udah');
          Navigator.push(
              navKey.currentContext,
              MaterialPageRoute(
                  builder: (_) => ResultUser(
                      result: message['data']['result'],
                      jumlah: message['data']['jumlah'],
                      name: message['data']['name'])));
        } else if (message['data']['notif'] == 'kedaluwarsa') {
          return showDialog(
            context: navKey.currentContext,
            builder: (_) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(navKey.currentContext).size.width * 0.05,
                          vertical: MediaQuery.of(navKey.currentContext).size.width * 0.06),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFF4F7F8)),
                      width: MediaQuery.of(navKey.currentContext).size.width * 0.7,
                      height: MediaQuery.of(navKey.currentContext).size.height * 0.15,
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(navKey.currentContext).size.width * 0.6,
                          child: FittedBox(
                            child: Text('Konfirmasi Transaksi telah kedaluwarsa',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF999494)),
                            textAlign: TextAlign.center))),
                      )));
            });
        }
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  void resultTransac(result, nm, jml, navKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nohp = prefs.getString('nohp');
    var pin = prefs.getString('pin');
    var url = 'https://bill.co.id/resultTransac';
    final response = await http.post(url, body: {
      'username': nohp,
      'password': pin,
      'result': result,
      'desti': nm,
      'jumlah': jml
    });

    if (response.statusCode == 200) {
      // Navigator.of(navKey.currentContext, rootNavigator: true).pop();
    } else {
      Navigator.of(navKey.currentContext, rootNavigator: true).pop();
      return showDialog(
          context: navKey.currentContext,
          builder: (_) {
            return WillPopScope(
              onWillPop: () {

                },
              child: Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  width: MediaQuery.of(navKey.currentContext).size.width * 0.65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF4F7F8)),
                    height: MediaQuery.of(navKey.currentContext).size.height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                        width: MediaQuery.of(navKey.currentContext).size.width * 0.5,
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
                                    width: MediaQuery.of(navKey.currentContext).size.width * 0.08,
                                    child: FittedBox(
                                      child: Text('Oke',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF0B8CAD))))),
                                  onPressed: () {
                                    Navigator.of(navKey.currentContext).pushReplacement(new MaterialPageRoute(
                                      builder: (_) => new Home()));
                                  })
                            ])
                      ]))));
          });
    }
  }
}
