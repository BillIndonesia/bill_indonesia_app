import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:shimmer/shimmer.dart';

class ResultVendor extends StatelessWidget {
  final String name;
  final String jumlah;
  final String result;

  ResultVendor({this.jumlah, this.name, this.result});
  @override
  Widget build(BuildContext context) {
    return ResultVendorPage(jumlah, name, result);
  }
}

class ResultVendorPage extends StatefulWidget {
  final String nm;
  final String jml;
  final String rs;

  ResultVendorPage(this.jml, this.nm, this.rs);
  @override
  ResultVendorPageState createState() => new ResultVendorPageState();
}

class ResultVendorPageState extends State<ResultVendorPage> {
  var nohp = '';
  var pin = '';
  var image = '';
  List data = List();
  bool udah = false;
  var user_role;

  @override
  Widget build(BuildContext context) {
    MoneyFormatterOutput fo = FlutterMoneyFormatter(
        amount: double.parse(widget.jml),
        settings: MoneyFormatterSettings(
          thousandSeparator: '.',
          decimalSeparator: ',',
        )).output;
    Uint8List bytes = base64.decode(image);
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (context) => new Home(usr: user_role)));
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF4F7F8),
        body: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                        Container(
                            // color: Colors.red,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.35,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.05),
                            child: Image(
                                image: widget.rs == 'Berhasil'
                                    ? AssetImage('images/berhasil.png')
                                    : AssetImage('images/gagal.png'))),
                        widget.rs == 'Berhasil'
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: FittedBox(
                                    child: RichText(
                                  textAlign: TextAlign.center,
                                  text: new TextSpan(
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xFF999494),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat'),
                                    children: <TextSpan>[
                                      new TextSpan(
                                          text:
                                              'Anda Berhasil menerima Pembayaran\n'),
                                      new TextSpan(
                                          text:
                                              'Sebesar Rp ${fo.withoutFractionDigits} dari'),
                                    ],
                                  ),
                                )))
                            : Container(
                                // color: Colors.red,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: FittedBox(
                                    child: RichText(
                                  textAlign: TextAlign.center,
                                  text: new TextSpan(
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xFF999494),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Montserrat'),
                                    children: <TextSpan>[
                                      new TextSpan(
                                          text:
                                              'Anda Gagal menerima Pembayaran\n'),
                                      new TextSpan(
                                          text:
                                              'Sebesar Rp ${fo.withoutFractionDigits} dari'),
                                    ],
                                  ),
                                ))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        udah == true
                            ? Container(
                                child: Column(children: <Widget>[
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height:
                                        MediaQuery.of(context).size.width * 0.2,
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
                                                    0.08,
                                                child: FittedBox(
                                                    child: Text(widget.nm[0],
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Color(
                                                                0xFFF4F7F8),
                                                            fontSize: 40)))))
                                        : Container()),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Container(
                                    // color: Colors.red,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Text(widget.nm,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 16,
                                                color: Color(0xFF423838),
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center)))
                              ]))
                            : Container(
                                child: Column(children: <Widget>[
                                Shimmer.fromColors(
                                    baseColor: Colors.grey[300],
                                    highlightColor: Colors.grey[100],
                                    enabled: true,
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.2,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle))),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Shimmer.fromColors(
                                    baseColor: Colors.grey[300],
                                    highlightColor: Colors.grey[100],
                                    enabled: true,
                                    child: Container(
                                        // color: Colors.red,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white)))
                              ])),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05)
                      ]))),
                  Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.01),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: RaisedButton(
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              child: FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: Text(
                                    widget.rs == 'Berhasil' ? 'Oke' : 'Kembali',
                                    style: new TextStyle(
                                        fontSize: 16.0,
                                        color: Color(0xFFF4F7F8),
                                        fontFamily: 'Montserrat'),
                                  ))),
                          color: Color(0xFF0B8CAD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            // Navigator.pop(context, false);
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new Home(usr: user_role)));
                          }))
                ])),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getImage();
  }

  void getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
      user_role = prefs.getString('user_role');
    });

    var urlgetImage = 'https://bill.co.id/getImage';
    final responsegetImage = await http.post(urlgetImage,
        body: {'username': nohp, 'password': pin, 'name': widget.nm});

    data = jsonDecode(responsegetImage.body);

    setState(() {
      udah = true;
      image = data[0]['image'];
    });
  }
}
