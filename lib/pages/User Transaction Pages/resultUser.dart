import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

class ResultUser extends StatelessWidget {
  final String name;
  final String jumlah;
  final String result;

  ResultUser({this.jumlah, this.name, this.result});
  @override
  Widget build(BuildContext context) {
    return ResultUserPage(jumlah, name, result);
  }
}

class ResultUserPage extends StatefulWidget {
  final String nm;
  final String jml;
  final String rs;

  ResultUserPage(this.jml, this.nm, this.rs);
  @override
  ResultUserPageState createState() => new ResultUserPageState();
}

class ResultUserPageState extends State<ResultUserPage> {
  var nohp = '';
  var pin = '';
  var image = '';
  List data = List();
  bool udah = false;
  var user_role;
  var date = DateTime.now();
  var vendorType = '';
  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<Null> openDialog() async {
    switch (await showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.width * 0.06,
            ),
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
                            fontSize: 20,
                            color: Color(0xFF999494),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat'),
                        children: <TextSpan>[
                          new TextSpan(text: 'sudah menunjukkan\n'),
                          new TextSpan(
                            text: 'halaman ini kepada supir ?',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: FittedBox(
                          child: Text(
                            'Sudah',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF999494),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                            builder: (context) => new Home(usr: user_role),
                          ),
                        );
                      },
                    ),
                    FlatButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: FittedBox(
                          child: Text(
                            'Belum',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0B8CAD),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    )) {
      case 1:
    }
  }

  @override
  Widget build(BuildContext context) {
    print('should be here');
    MoneyFormatterOutput fo = FlutterMoneyFormatter(
      amount: double.parse(widget.jml),
      settings: MoneyFormatterSettings(
        thousandSeparator: '.',
        decimalSeparator: ',',
      ),
    ).output;
    Uint8List bytes = base64.decode(image);
    return WillPopScope(
      onWillPop: vendorType == 'fixed' && widget.rs == 'Berhasil'
          ? onBackPress
          : () {
              Navigator.pop(context, false);
              Navigator.of(context).pushReplacement(
                new MaterialPageRoute(
                  builder: (context) => new Home(usr: user_role),
                ),
              );
              return;
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
                      //Image Gagal/Berhasil -->
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.35,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1,
                          bottom: MediaQuery.of(context).size.height * 0.05,
                        ),
                        child: Image(
                          image: widget.rs == 'Berhasil'
                              ? AssetImage('images/berhasil.png')
                              : AssetImage('images/gagal.png'),
                        ),
                      ),
                      //Text Info Gagal/Berhasil -->
                      widget.rs == 'Berhasil'
                          //TextSpan Berhasil
                          ? vendorType == 'fixed'
                              //TextSpan Angkot
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
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
                                                  'Anda Berhasil membayar angkot\n'),
                                          new TextSpan(
                                              text:
                                                  'Sebesar Rp. ${fo.withoutFractionDigits} pada jam '),
                                          new TextSpan(
                                            text:
                                                '${DateFormat('HH.mm').format(date)}\n',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          new TextSpan(text: 'kepada'),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              //TextSpan Vendor
                              : Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
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
                                                'Anda Berhasil melakukan Pembayaran\n'),
                                        new TextSpan(
                                            text:
                                                'Sebesar Rp ${fo.withoutFractionDigits} kepada'),
                                      ],
                                    ),
                                  )))
                          //TextSpan Gagal
                          : Container(
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
                                              'Anda Gagal melakukan Pembayaran\n'),
                                      new TextSpan(
                                          text:
                                              'Sebesar Rp ${fo.withoutFractionDigits}'),
                                      widget.rs == 'Gagal Saldo'
                                          ? new TextSpan(
                                              text:
                                                  '\nKarena Saldo anda tidak mencukupi')
                                          : new TextSpan(text: ''),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      //Gambar Penerima Dan Nama Penerima
                      udah == true
                          ? Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height:
                                        MediaQuery.of(context).size.width * 0.2,
//Decorasi Image
                                    decoration: image != ''
                                        ? BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: MemoryImage(bytes),
                                            ),
                                          )
                                        : BoxDecoration(shape: BoxShape.circle),
//Bolean Image
                                    child: image == ''
                                        ? CircleAvatar(
                                            backgroundColor: Color(0xFF0485AC),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                              child: FittedBox(
                                                child: Text(
                                                  widget.nm[0],
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xFFF4F7F8),
                                                      fontSize: 40),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
// Nama Penerima
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    child: FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Text(widget.nm,
                                          style: vendorType == 'fixed'
                                              ? TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 1,
                                                  color: Color(0xFF423838),
                                                  fontWeight: FontWeight.w600)
                                              : TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16,
                                                  color: Color(0xFF423838),
                                                  fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          //shimmer
                          : Container(
                              child: Column(
                                children: <Widget>[
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300],
                                    highlightColor: Colors.grey[100],
                                    enabled: true,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.2,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300],
                                    highlightColor: Colors.grey[100],
                                    enabled: true,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      )
                    ],
                  ),
                ),
              ),
              //Bolean Tampilan notifikasi khusus angkot
              vendorType == 'fixed' && widget.rs == 'Berhasil'
                  ? Container(
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.02,
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.018,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          '*Tunjukan halaman ini kepada supir sebagai bukti pembayaran',
                          style: TextStyle(
                            fontFamily: 'monsetrat',
                            fontSize: 16,
                            color: Color(0xFF5A5B5C),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              //Tombol Paling Bawah
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.06,
                child: RaisedButton(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.035,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        widget.rs == 'Berhasil' ? 'Oke' : 'Kembali',
                        style: new TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFFF4F7F8),
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                  color: Color(0xFF0B8CAD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: vendorType == 'fixed' && widget.rs == 'Berhasil'
                      ? onBackPress
                      : () {
                          Navigator.pop(context, false);
                          Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                              builder: (context) => new Home(usr: user_role),
                            ),
                          );
                          return;
                        },
                ),
              ),
            ],
          ),
        ),
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
      vendorType = data[0]['vendor_price_type'];
      udah = true;
      image = data[0]['image'];
    });
  }
}
