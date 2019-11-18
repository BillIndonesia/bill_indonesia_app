import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:bill/pages/riwayat.dart';
import 'dart:convert';

class Filter extends CupertinoPageRoute {
  final String awal;
  final String akhir;
  final String topup;
  final String pembayaran;
  final String debit;
  final String kredit;

  Filter(
      {this.awal,
      this.akhir,
      this.topup,
      this.pembayaran,
      this.debit,
      this.kredit})
      : super(
            builder: (BuildContext context) =>
                new FilterPage(awal, akhir, topup, pembayaran, debit, kredit));

  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SlideTransition(
        position: Tween<Offset>(begin: Offset(0, 0), end: Offset.zero)
            .animate(animation),
        child: FilterPage(awal, akhir, topup, pembayaran, debit, kredit));
  }
}

class FilterPage extends StatefulWidget {
  final String aw;
  final String ak;
  final String to;
  final String pe;
  final String db;
  final String kr;
  FilterPage(this.aw, this.ak, this.to, this.pe, this.db, this.kr);
  @override
  FilterPageState createState() => new FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  final awalController = TextEditingController();
  final akhirController = TextEditingController();
  bool topup = false;
  bool pembayaran = false;
  bool debit = false;
  bool kredit = false;
  DateTime dateAwal = DateTime.now();
  DateTime dateAkhir = DateTime.now();
  var first;
  bool setAwal = false;
  bool setAkhir = false;
  var awal;
  var akhir;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
        },
        child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                title: Text('Filter',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF423838))),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Color(0xFF777E81), 
                        size: 30),
                    onPressed: () {
                      Navigator.pop(context, false);
                    }),
                backgroundColor: Color(0xFFF4F7F8),
                elevation: 0.0),
            backgroundColor: Color(0xFFF4F7F8),
            body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // color: Colors.red,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Column(children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.15,
                            // color: Colors.yellow,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Tanggal',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xFF423838))),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Tanggal awal',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 14,
                                                      color: Color(0xFF999494))),
                                              GestureDetector(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: MediaQuery.of(context).size.height * 0.01),
                                                      width: MediaQuery.of(context).size.width * 0.42,
                                                      height: MediaQuery.of(context).size.height * 0.06,
                                                      child: AbsorbPointer(
                                                        child: TextFormField(
                                                          controller: awalController,
                                                          decoration: InputDecoration(
                                                            contentPadding: EdgeInsets.only(
                                                                bottom: MediaQuery.of(context).size.height * 0.09,
                                                                left: MediaQuery.of(context).size.width * 0.02),
                                                            suffixIcon: Image.asset('images/calendar.png'),
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(10.0)),
                                                          ),
                                                        ),
                                                      )),
                                                  onTap: () {
                                                    selectDate(context, 'awal');
                                                  })
                                            ]),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('Tanggal akhir',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 14,
                                                      color: Color(0xFF999494))),
                                              GestureDetector(
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: MediaQuery.of(context).size.height * 0.01),
                                                      width: MediaQuery.of(context).size.width * 0.42,
                                                      height: MediaQuery.of(context).size.height * 0.06,
                                                      child: AbsorbPointer(
                                                        child: TextFormField(
                                                          controller: akhirController,
                                                          decoration: InputDecoration(
                                                            contentPadding: EdgeInsets.only(
                                                                bottom: MediaQuery.of(context).size.height * 0.09,
                                                                left: MediaQuery.of(context).size.width * 0.02),
                                                            suffixIcon: Image.asset('images/calendar.png'),
                                                            border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(10.0)),
                                                          ),
                                                        ),
                                                      )),
                                                  onTap: () {
                                                    selectDate(context, 'akhir');
                                                  })
                                            ])
                                      ])
                                ])),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Color(0xFFE5E5E5),
                                        width: 1.0)))),
                        Container(
                            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.045),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.13,
                            // color: Colors.yellow,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Saldo',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xFF423838))),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: topup == false
                                                        ? Color(0xFF8b8484)
                                                        : Color(0xFF2C81B7)),
                                                borderRadius: BorderRadius.circular(10)),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context).size.height * 0.01),
                                            width: MediaQuery.of(context).size.width * 0.42,
                                            height: MediaQuery.of(context).size.height * 0.063,
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                onPressed: () {
                                                  if (topup == true) {
                                                    setState(() {
                                                      topup = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      topup = true;
                                                    });
                                                  }
                                                },
                                                color: Color(0xFFF4F7F8),
                                                child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                      topup == true
                                                          ? Container(
                                                              margin: EdgeInsets.only(
                                                                  right: MediaQuery.of(context).size.width * 0.015),
                                                              child: Icon(
                                                                  Icons.check,
                                                                  color: Color(0xFF2C81B7)))
                                                          : Container(),
                                                      Text('Top Up',
                                                          style: TextStyle(
                                                              color: topup ==false
                                                                  ? Color(0xFF000000)
                                                                  : Color(0xFF2C81B7),
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.normal))
                                                    ]))),
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: pembayaran == false
                                                        ? Color(0xFF8b8484)
                                                        : Color(0xFF2C81B7)),
                                                borderRadius: BorderRadius.circular(10)),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context).size.height * 0.01),
                                            width: MediaQuery.of(context).size.width * 0.42,
                                            height: MediaQuery.of(context).size.height * 0.063,
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                onPressed: () {
                                                  if (pembayaran == true) {
                                                    setState(() {
                                                      pembayaran = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      pembayaran = true;
                                                    });
                                                  }
                                                },
                                                color: Color(0xFFF4F7F8),
                                                child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                      pembayaran == true
                                                          ? Container(
                                                              margin: EdgeInsets.only(
                                                                  right: MediaQuery.of(context).size.width * 0.015),
                                                              child: Icon(
                                                                  Icons.check,
                                                                  color: Color(0xFF2C81B7)))
                                                          : Container(),
                                                      Text('Pembayaran',
                                                          style: TextStyle(
                                                              color: pembayaran == false
                                                                  ? Color(0xFF000000)
                                                                  : Color(0xFF2C81B7),
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.normal))
                                                    ]))),
                                      ])
                                ])),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Color(0xFFE5E5E5),
                                        width: 1.0)))),
                        Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.045),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.13,
                            // color: Colors.yellow,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('Transaksi',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xFF423838))),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: debit == false
                                                        ? Color(0xFF8b8484)
                                                        : Color(0xFF2C81B7)),
                                                borderRadius: BorderRadius.circular(10)),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context).size.height * 0.01),
                                            width: MediaQuery.of(context).size.width * 0.42,
                                            height: MediaQuery.of(context).size.height * 0.063,
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                onPressed: () {
                                                  if (debit == true) {
                                                    setState(() {
                                                      debit = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      debit = true;
                                                    });
                                                  }
                                                },
                                                color: Color(0xFFF4F7F8),
                                                child: Row(
                                                        mainAxisAlignment:MainAxisAlignment.center,
                                                        children: <Widget>[
                                                      debit == true
                                                          ? Container(
                                                              margin: EdgeInsets.only(
                                                                  right: MediaQuery.of(context).size.width * 0.015),
                                                              child: Icon(
                                                                  Icons.check,
                                                                  color: Color(0xFF2C81B7)))
                                                          : Container(),
                                                      Text('Keluar',
                                                          style: TextStyle(
                                                              color: debit == false
                                                                  ? Color(0xFF000000)
                                                                  : Color(0xFF2C81B7),
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.normal))
                                                    ]))),
                                        Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: kredit == false
                                                        ? Color(0xFF8b8484)
                                                        : Color(0xFF2C81B7)),
                                                borderRadius: BorderRadius.circular(10)),
                                            margin: EdgeInsets.only(
                                                top: MediaQuery.of(context).size.height * 0.01),
                                            width: MediaQuery.of(context).size.width * 0.42,
                                            height: MediaQuery.of(context).size.height * 0.063,
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                onPressed: () {
                                                  if (kredit == true) {
                                                    setState(() {
                                                      kredit = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      kredit = true;
                                                    });
                                                  }
                                                },
                                                color: Color(0xFFF4F7F8),
                                                child:
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: <Widget>[
                                                      kredit == true
                                                          ? Container(
                                                              margin: EdgeInsets.only(
                                                                  right: MediaQuery.of(context).size.width * 0.015),
                                                              child: Icon(Icons.check,
                                                                  color: Color(0xFF2C81B7)))
                                                          : Container(),
                                                      Text('Masuk',
                                                          style: TextStyle(
                                                              color: kredit == false
                                                                  ? Color(0xFF000000)
                                                                  : Color(0xFF2C81B7),
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.normal))
                                                    ]))),
                                      ])
                                ]))
                      ])),
                      // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                          child: Column(children: <Widget>[
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.height * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.height * 0.01),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF8b8484)),
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  aktifkan();
                                },
                                color: Color(0xFF0B8CAD),
                                child: Text('Aktifkan',
                                    style: TextStyle(
                                        color: Color(0xFFF4F7F8),
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)))),
                        Container(
                            margin: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.height * 0.00,
                                MediaQuery.of(context).size.width * 0.045,
                                MediaQuery.of(context).size.height * 0.03),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF2C81B7)),
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  setState(() {
                                    topup = false;
                                    pembayaran = false;
                                    debit = false;
                                    kredit = false;
                                    awalController.text = '';
                                    akhirController.text = '';
                                    dateAwal = first;
                                    dateAkhir = DateTime.now();
                                  });
                                },
                                color: Color(0xFFF4F7F8),
                                child: Text('Atur Ulang',
                                    style: TextStyle(
                                        color: Color(0xFF0B8CAD),
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)))),
                      ]))
                    ]))));
  }

  void selectDate(BuildContext context, String tipe) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: tipe == 'awal'
            ? dateAwal
            : akhirController.text == '' ? dateAwal : dateAkhir,
        firstDate: tipe == 'awal' ? first : dateAwal,
        lastDate: DateTime(2020));
    var date = DateFormat('dd/MM/yyyy').format(picked);
    if (picked != null && picked != DateTime.now())
      setState(() {
        if (tipe == 'awal') {
          setAwal = true;
          dateAwal = picked;
          awalController.text = date;
        } else {
          setAkhir = true;
          dateAkhir = picked;
          akhirController.text = date;
        }
      });
  }

  void aktifkan() async {
    if (setAwal == true) {
      awal = DateFormat('MM/dd/yyyy').format(dateAwal);
    } else {
      awal = '';
    }

    if (setAkhir == true) {
      akhir = DateFormat('MM/dd/yyyy').format(dateAkhir);
    } else {
      akhir = '';
    }
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (context) => new Riwayat(
            tipe: 'filter',
            awal: awal,
            akhir: akhir,
            topup: topup.toString(),
            pembayaran: pembayaran.toString(),
            debit: debit.toString(),
            kredit: kredit.toString())));
  }

  @override
  void initState() {
    this.firstDate();
    setState(() {
      if (widget.ak != null && widget.ak != '') {
        var formatAkhir = DateFormat('MM/dd/yyyy').parse(widget.ak);
        // if (DateFormat('dd/MM/yyyy').format(formatAkhir) !=
            // DateFormat('dd/MM/yyyy').format(dateAkhir)) {
          akhirController.text = DateFormat('dd/MM/yyyy').format(formatAkhir);
          dateAkhir = formatAkhir;
        // }
      }
      if (widget.to != null) {
        if (widget.to != 'false') {
          topup = true;
        }
      }
      if (widget.pe != null) {
        if (widget.pe != 'false') {
          pembayaran = true;
        }
      }
      if (widget.db != null) {
        if (widget.db != 'false') {
          debit = true;
        }
      }
      if (widget.kr != null) {
        if (widget.kr != 'false') {
          kredit = true;
        }
      }
    });
  }

  void firstDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var nohp = prefs.getString('nohp');
    var pin = prefs.getString('pin');

    var url = 'https://bill.co.id/firstDate';
    final response = await http.post(url, body: {'username': nohp, 'password': pin});

    List data = jsonDecode(response.body);

    setState(() {
      if (data.isEmpty) {
        first = DateFormat('yyyy-MM-dd').parse(DateTime.now().toString());
        dateAwal = DateFormat('yyyy-MM-dd').parse(DateTime.now().toString());
      } else {
        first = DateFormat('yyyy-MM-dd').parse(data[0]['payment_date']);
        dateAwal = DateFormat('yyyy-MM-dd').parse(data[0]['payment_date']);
      }
      if (widget.aw != null && widget.aw != '') {
        var formatAwal = DateFormat('MM/dd/yyyy').parse(widget.aw);
        // if (DateFormat('dd/MM/yyyy').format(formatAwal) !=
            // DateFormat('dd/MM/yyyy').format(dateAwal)) {
          awalController.text = DateFormat('dd/MM/yyyy').format(formatAwal);
          dateAwal = formatAwal;
        // }
      }
    });
  }
}
