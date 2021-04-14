import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:shimmer/shimmer.dart';

class PayKwk extends StatelessWidget {
  final String nohpResult;
  final String name;
  final String tipe;
  final String noHpUser;
  final String pinUser;
  final String angkotName;
  final String angkotImage;
  PayKwk(
      {this.nohpResult,
      this.name,
      this.tipe,
      this.noHpUser,
      this.pinUser,
      this.angkotName,
      this.angkotImage});

  @override
  Widget build(BuildContext context) {
    return PayKwkPage(
      nohpResult,
      name,
      tipe,
      noHpUser,
      pinUser,
      angkotName,
      angkotImage,
    );
  }
}

class PayKwkPage extends StatefulWidget {
  final String nohpTujuan;
  final String nm;
  final String tp;
  final String noHpUser;
  final String pinUser;
  final String angkotName;
  final String angkotImage;

  PayKwkPage(
    this.nohpTujuan,
    this.nm,
    this.tp,
    this.noHpUser,
    this.pinUser,
    this.angkotName,
    this.angkotImage,
  );

  @override
  PayKwkPageState createState() => new PayKwkPageState();
}

class PayKwkPageState extends State<PayKwkPage> {
  // final _formKey = GlobalKey<FormState>();
  final jumlahController = TextEditingController();
  Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    bytes = base64.decode(widget.angkotImage);
    ErrorWidget.builder = (FlutterErrorDetails details) =>
        Scaffold(backgroundColor: Colors.white);

    return WillPopScope(
      onWillPop: () {
        return Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => new Home(usr: 'user'),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Container(
            width: MediaQuery.of(context).size.width * 0.43,
            child: FittedBox(
              child: Text(
                'Pembayaran Angkot',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(
                    0xFF423838,
                  ),
                ),
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF777E81), size: 30),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => new Home(usr: 'user'),
                ),
              );
            },
          ),
          backgroundColor: Color(0xFFF4F7F8),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xFFF4F7F8),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.04,
              right: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //Destination Profile
                Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Destination PRofile
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Card(
                          color: Color(0xFFE4F2FB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.02),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                            decoration: widget.angkotImage != ''
                                                ? BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: MemoryImage(
                                                        bytes,
                                                      ),
                                                    ),
                                                  )
                                                : BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                            child: widget.angkotImage == ''
                                                ? CircleAvatar(
                                                    backgroundColor:
                                                        Color(0xFF0485AC),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.04,
                                                      child: FittedBox(
                                                        child: Text(
                                                          widget.angkotName !=
                                                                  ''
                                                              ? widget
                                                                  .angkotName
                                                              : '',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Color(
                                                                0xFFF4F7F8),
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.006),
                                      Expanded(
                                        child: Container(
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              widget.angkotName.split(' ')[0],
                                              style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.normal,
                                                color: Color(
                                                  0xFF999494,
                                                ),
                                              ),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.006),
                                      Expanded(
                                          child: Container(
                                              child: FittedBox(
                                                  fit: BoxFit.fitWidth,
                                                  child: Text(widget.nohpTujuan,
                                                      style: TextStyle(
                                                          fontSize: 12.0,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xFF6c6565))))))
                                    ]))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //teks Nominal
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          bottom: MediaQuery.of(context).size.height * 0.01,
                        ),
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: FittedBox(
                                child: Text(
                                  'Anda Akan membayar sebesar',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13,
                                    color: Color(0xFF999494),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: TextFormField(
                                  focusNode: AlwaysDisabledFocusNode(),
                                  controller: jumlahController,
                                  style: TextStyle(
                                    color: Color(0xFF6c6565),
                                    fontSize: 24.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    suffix: IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () {
                                        setState(() {
                                          jumlahController.text = '';
                                        });
                                      },
                                    ),
                                    hintText: 'Rp 0',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF6c6565),
                                      fontSize: 24.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
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
                //Nominal Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Nominal button 2000 - 4000
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Button 2.000
                          GestureDetector(
                            child: nominalButtonTemplate(
                              context,
                              'images/10.png',
                              '2.000',
                            ),
                            onTap: () {
                              if (jumlahController.text == '') {
                                jumlahController.text = '0';
                              }
                              var sementara = (int.parse(jumlahController.text
                                          .replaceAll('.', '')) +
                                      2000)
                                  .toString();
                              MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                amount: double.parse(sementara),
                                settings: MoneyFormatterSettings(
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                ),
                              ).output;
                              setState(
                                () {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                },
                              );
                            },
                          ),
                          //Button 3.000
                          GestureDetector(
                            child: nominalButtonTemplate(
                              context,
                              'images/10.png',
                              '3.000',
                            ),
                            onTap: () {
                              if (jumlahController.text == '') {
                                jumlahController.text = '0';
                              }
                              var sementara = (int.parse(jumlahController.text
                                          .replaceAll('.', '')) +
                                      3000)
                                  .toString();
                              MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                amount: double.parse(sementara),
                                settings: MoneyFormatterSettings(
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                ),
                              ).output;
                              setState(
                                () {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                },
                              );
                            },
                          ),
                          //button 4.000
                          GestureDetector(
                            child: nominalButtonTemplate(
                              context,
                              'images/30.png',
                              '4.000',
                            ),
                            onTap: () {
                              if (jumlahController.text == '') {
                                jumlahController.text = '0';
                              }
                              var sementara = (int.parse(jumlahController.text
                                          .replaceAll('.', '')) +
                                      4000)
                                  .toString();
                              MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                amount: double.parse(sementara),
                                settings: MoneyFormatterSettings(
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                ),
                              ).output;
                              setState(
                                () {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    //Nominal Button 3000 - 7000
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Button 5.000
                          GestureDetector(
                            child: nominalButtonTemplate(
                              context,
                              'images/50.png',
                              '5.000',
                            ),
                            onTap: () {
                              if (jumlahController.text == '') {
                                jumlahController.text = '0';
                              }
                              var sementara = (int.parse(jumlahController.text
                                          .replaceAll('.', '')) +
                                      5000)
                                  .toString();
                              MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                amount: double.parse(sementara),
                                settings: MoneyFormatterSettings(
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                ),
                              ).output;
                              setState(
                                () {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                },
                              );
                            },
                          ),
                          //Button 6.000
                          GestureDetector(
                            child: nominalButtonTemplate(
                              context,
                              'images/100.png',
                              '6.000',
                            ),
                            onTap: () {
                              if (jumlahController.text == '') {
                                jumlahController.text = '0';
                              }
                              var sementara = (int.parse(jumlahController.text
                                          .replaceAll('.', '')) +
                                      6000)
                                  .toString();
                              MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                amount: double.parse(sementara),
                                settings: MoneyFormatterSettings(
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                ),
                              ).output;
                              setState(
                                () {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                },
                              );
                            },
                          ),
                          //button 7.000
                          GestureDetector(
                            child: nominalButtonTemplate(
                              context,
                              'images/100.png',
                              '7.000',
                            ),
                            onTap: () {
                              if (jumlahController.text == '') {
                                jumlahController.text = '0';
                              }
                              var sementara = (int.parse(jumlahController.text
                                          .replaceAll('.', '')) +
                                      7000)
                                  .toString();
                              MoneyFormatterOutput fo = FlutterMoneyFormatter(
                                amount: double.parse(sementara),
                                settings: MoneyFormatterSettings(
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                ),
                              ).output;
                              setState(
                                () {
                                  jumlahController.text =
                                      fo.withoutFractionDigits.toString();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                // Visible Button
                jumlahController.text != '' &&
                        (int.parse(jumlahController.text.replaceAll('.', '')) +
                                1) !=
                            1
                    ? Visibility(
                        visible: (int.parse(jumlahController.text
                                        .replaceAll('.', '')) +
                                    1) !=
                                1
                            ? true
                            : false,
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * 0.05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //Cancel Button
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF0B8CAD),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Color(0xFF0B8CAD),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: FittedBox(
                                      child: Text(
                                        'Batal',
                                        style: TextStyle(
                                          color: Color(0xFFF4F7F8),
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      new MaterialPageRoute(
                                        builder: (context) =>
                                            new Home(usr: 'user'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              //Confirm Button
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFF0B8CAD),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    kirim();
                                    return showDialog(
                                      context: context,
                                      useRootNavigator: false,
                                      builder: (context) {
                                        return Material(
                                          type: MaterialType.transparency,
                                        );
                                      },
                                    );
                                  },
                                  color: Color(0xFFF4F7F8),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.38,
                                    child: FittedBox(
                                      child: Text(
                                        'Konfirmasi Pembayaran',
                                        style: TextStyle(
                                          color: Color(0xFF0B8CAD),
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    //Filler when not Vissible
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void kirim() async {
    var url = 'https://bill.co.id/resultTransac';
    final responseTransaction = await http.post(url, body: {
      'username': widget.noHpUser,
      'password': widget.pinUser,
      'result': 'Berhasil',
      'desti': widget.angkotName,
      'jumlah': jumlahController.text.replaceAll('.', '')
    });
    print(jsonDecode(responseTransaction.body));
    Navigator.of(context, rootNavigator: true).pop();
  }

  Row nominalButtonTemplate(
      BuildContext context, String images, String nominal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image(
          image: AssetImage(images),
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.width * 0.15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.18,
          child: FittedBox(
            child: Text(
              "Rp $nominal",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
