import 'package:bill/models/authentification.dart';
import 'package:bill/models/services.dart';
import 'package:bill/pages/Login%20Pages/pin.dart';
import 'package:bill/pages/getotp.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:bill/pages/intro.dart';
import 'package:bill/pages/home.dart';
import 'package:bill/pages/suspend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:bill/firebase_notification.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Services(),
        ),
        ChangeNotifierProvider.value(
          value: Authentification(),
        ),
      ],
      child: MaterialApp(
        title: 'Bill',
        theme: ThemeData(
            primaryColor: Color(0xFFF4F7F8),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nohp = '';
  List data = List();
  bool active;
  bool done = false;
  bool connect = false;
  var user_role = '';
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    new FirebaseNotifications().setUpFirebase(navigatorKey);
    this.getSignIn();
  }

  void getSignIn() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        setState(() {
          nohp = prefs.getString('nohp');
        });

        if (nohp != null) {
          var no = prefs.getString('nohp');
          var url = 'https://bill.co.id/getActive';
          final response = await http.post(url, body: {'nohp': no});

          data = jsonDecode(response.body);

          setState(() {
            done = true;
            connect = true;
            active = data[0]['active'];
            user_role = data[0]['user_role'];
            prefs.setString('user_role', user_role);
            prefs.setString('vendor_type',
                jsonDecode(response.body)[0]['vendor_price_type']);
          });
        } else {
          setState(() {
            done = true;
            connect = true;
          });
        }
      }
    } on SocketException catch (_) {
      setState(() {
        done = true;
        connect = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (done == false && nohp != null) {
      return MaterialApp(
        title: 'Bill',
        theme: ThemeData(
            primaryColor: Color(0xFFF4F7F8),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: Stack(children: <Widget>[]),
        ),
      );
    } else {
      if (connect == true) {
        return MaterialApp(
            title: 'Bill',
            theme: ThemeData(
                primaryColor: Color(0xFFF4F7F8),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            navigatorKey: navigatorKey,
            home: nohp == null
                // ? Pin(nohp: '05')
                ? Intro(navigatorKey: navigatorKey)
                : active == true
                    ? Home(usr: user_role)
                    : Suspend());
      } else {
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
                  child: Text('Periksa koneksi internet anda',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF999494)),
                      textAlign: TextAlign.center),
                )));
      }
    }
  }
}
