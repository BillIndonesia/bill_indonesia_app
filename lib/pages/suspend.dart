import 'package:bill/pages/Login%20Pages/notelp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Suspend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SuspendPage();
  }
}

class SuspendPage extends StatefulWidget {
  @override
  SuspendPageState createState() => new SuspendPageState();
}

class SuspendPageState extends State<SuspendPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => new Login()));
        },
        child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Color(0xFFF4F7F8), size: 30),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => new Login()));
                    }),
                backgroundColor: Color(0xFF0485AC),
                elevation: 0.0),
            body: Stack(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF0485AC), Color(0xFF36B8B6)],
                  ))),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        flex: 10,
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.08),
                                  child: Image.asset('images/suspend.png')),
                              Container(
                                  margin: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.04),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: FittedBox(
                                          child: RichText(
                                        textAlign: TextAlign.center,
                                        text: new TextSpan(
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Montserrat'),
                                          children: <TextSpan>[
                                            new TextSpan(
                                                text:
                                                    'Tenang apabila anda merasa tidak ada\n'),
                                            new TextSpan(
                                                text:
                                                    'yang salah, silahkan hubungi admin kami'),
                                          ],
                                        ),
                                      ))))
                            ]))),
                    Expanded(
                        child: Container(
                            color: Color(0xFFF4F7F8),
                            child: Row(children: <Widget>[
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        launch("tel:+6281224037210");
                                      },
                                      child: Container(
                                          color: Color(0xFFF4F7F8),
                                          alignment: Alignment.center,
                                          child: Icon(Icons.call,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              color: Color(0xFF999494))))),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.1,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              color: Color(0xFFC7C6C6),
                                              width: 1.0)))),
                              Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        launch(
                                            "mailto:info@bill.co.id?subject=Suspend");
                                      },
                                      child: Container(
                                          color: Color(0xFFF4F7F8),
                                          alignment: Alignment.center,
                                          child: Icon(Icons.email,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              color: Color(0xFF999494)))))
                            ])))
                  ])
            ])));
  }

  @override
  void initState() {
    super.initState();
    this.deleteShared();
  }

  void deleteShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('nohp');
    prefs.remove('pin');
  }
}
