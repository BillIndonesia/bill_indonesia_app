import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:bill/widgets/kesalahan_server_dialog.dart';
import 'package:bill/widgets/periksa_internet_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Authentification with ChangeNotifier {
  String nohp;
  String nama;
  String pin;
  String image;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // Login Nomor telphone
  Future<bool> signinNomor(String noHp, context) async {
    var _declare;
    var url = 'https://bill.co.id/searchNotelp';
    Timer t = Timer(
      Duration(milliseconds: 30200),
      () {
        return showDialog(
          context: context,
          builder: (context) => PeriksaInternetDialog(false),
        );
      },
    );
    try {
      final response = await http.post(
        url,
        body: {
          'notelp': noHp,
        },
      ).timeout(
        Duration(seconds: 30),
      );
      if (response.statusCode == 200) {
        if (response.body == "Tidak") {
          t.cancel();
          _declare = false;
        } else if (response.body == 'Iya') {
          t.cancel();
          _declare = true;
        }
      } else {
        return showDialog(
          context: context,
          builder: (context) => KesalahanServerDialog(),
        );
      }
      t.cancel();
    } on SocketException catch (e) {
      print(e);
      t.cancel();
      showDialog(
        context: context,
        builder: (context) => PeriksaInternetDialog(false),
      );
    }
    return _declare;
  }

  Future<bool> signinPin(String _noHp, String _pin, context) async {
    bool _declare;
    var url = 'https://bill.co.id/apiflutter';
    Timer t = Timer(
      Duration(milliseconds: 16000),
      () {
        return showDialog(
          context: context,
          builder: (context) => PeriksaInternetDialog(false),
        );
      },
    );
    try {
      final response = await http.post(
        url,
        body: {
          'username': _noHp,
          'password': _pin,
        },
      ).timeout(
        Duration(seconds: 20),
      );
      if (response.body == "False") {
        _declare = false;
      } else {
        await getToken(_noHp, _pin, context)
            ? _declare = true
            : showDialog(
                context: context,
                builder: (context) => KesalahanServerDialog(),
              );
        // await Provider.of<User>(context).saveInMemory(
        //   _noHp,
        //   _pin,
        // );
      }
      t.cancel();
    } catch (e) {
      print(e);
      t.cancel();
      showDialog(
        context: context,
        builder: (context) => PeriksaInternetDialog(false),
      );
    }
    print(_noHp + ' ' + _pin + ' declare = $_declare');
    return _declare;
  }

  Future<bool> getToken(String _noHp, String _pin, context) async {
    return await _firebaseMessaging.getToken().then(
      (token) async {
        var url = 'https://bill.co.id/saveToken';
        try {
          final response = await http.post(
            url,
            body: {
              'username': _noHp,
              'password': _pin,
              'token': token,
            },
          ).timeout(
            Duration(seconds: 10),
          );
          if (response.statusCode == 200) {
            print('aku berhasil dapat token');
            print(token);
            return true;
          } else {
            return false;
          }
        } catch (e) {
          print('error di get token $e');
          showDialog(
            context: context,
            builder: (context) => KesalahanServerDialog(),
          );
          throw (e);
        }
      },
    );
  }
}

class Signup with ChangeNotifier {
  Future<bool> getOtp(String _noHp) async {
    return false;
  }
}
