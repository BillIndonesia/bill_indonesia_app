import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class ResultVendorTopup extends StatelessWidget {
  final String name;
  final String image;
  final String jumlah;
  final String result;

  ResultVendorTopup({this.name, this.image, this.jumlah, this.result});
  @override
  Widget build(BuildContext context) {
    return ResultVendorTopupPage(name, image, jumlah, result);
  }
}

class ResultVendorTopupPage extends StatefulWidget {
  final String nm;
  final String img;
  final String jml;
  final String rs;

  ResultVendorTopupPage(this.nm, this.img, this.jml, this.rs);
  @override
  ResultVendorTopupPageState createState() => new ResultVendorTopupPageState();
}

class ResultVendorTopupPageState extends State<ResultVendorTopupPage> {
  var nohp = '';
  var pin = '';

  @override
  Widget build(BuildContext context) {
    MoneyFormatterOutput fo = FlutterMoneyFormatter(
        amount: double.parse(widget.jml),
        settings: MoneyFormatterSettings(
          thousandSeparator: '.',
          decimalSeparator: ',',
        )).output;
    Uint8List bytes = base64.decode(widget.img);
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        Navigator.of(context)
            .pushReplacement(new MaterialPageRoute(builder: (context) => new Home()));
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
                          // color: Colors.green,
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.35,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1,
                                bottom: MediaQuery.of(context).size.height * 0.05),
                            child: Image(
                                image: widget.rs == 'Berhasil'
                                    ? AssetImage('images/berhasil.png')
                                    : AssetImage('images/gagal.png'))),
                        widget.rs == 'Berhasil'
                            ? Container(
                              // color: Colors.green,
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
                                            'Anda Berhasil melakukan Top Up\n'),
                                    new TextSpan(
                                        text:
                                            'Sebesar Rp ${fo.withoutFractionDigits} kepada'),
                                  ],
                                ),
                              )))
                            : Container(
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
                                            'Top Up sebesar Rp ${fo.withoutFractionDigits} gagal\n'),
                                    new TextSpan(text: 'dilakukan kepada'),
                                  ],
                                ),
                              ))),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        Container(
                            child: Column(children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.width * 0.2,
                              decoration: widget.img != ''
                                  ? BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: MemoryImage(bytes)))
                                  : BoxDecoration(shape: BoxShape.circle),
                              child: widget.img == ''
                                  ? CircleAvatar(
                                      backgroundColor: Color(0xFF0485AC),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.08,
                                        child: FittedBox(
                                          child: Text(widget.nm[0],
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xFFF4F7F8),
                                                  fontSize: 40)))))
                                  : Container()),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Container(
                            // color: Colors.red,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(widget.nm,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  color: Color(0xFF423838),
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center)))
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
                            height: MediaQuery.of(context).size.height * 0.03,
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
                            Navigator.pop(context, false);
                            Navigator.of(context).pushReplacement(new MaterialPageRoute(
                                builder: (context) => new Home()));
                          }))
                ])),
      ),
    );
  }
}
