import 'package:flutter/material.dart';
import 'package:bill/pages/home.dart';
import 'package:bill/pages/filter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:intl/intl.dart';
import 'package:loader_search_bar/loader_search_bar.dart';
import 'package:shimmer/shimmer.dart';

class Riwayat extends StatelessWidget {
  final String tipe;
  final String awal;
  final String akhir;
  final String topup;
  final String pembayaran;
  final String debit;
  final String kredit;
  Riwayat(
      {this.tipe,
      this.awal,
      this.akhir,
      this.topup,
      this.pembayaran,
      this.debit,
      this.kredit});
  @override
  Widget build(BuildContext context) {
    return RiwayatPage(tipe, awal, akhir, topup, pembayaran, debit, kredit);
  }
}

class RiwayatPage extends StatefulWidget {
  final String tp;
  final String aw;
  final String ak;
  final String to;
  final String pe;
  final String db;
  final String kr;
  RiwayatPage(this.tp, this.aw, this.ak, this.to, this.pe, this.db, this.kr);
  @override
  RiwayatPageState createState() => new RiwayatPageState();
}

class RiwayatPageState extends State<RiwayatPage> {
  var url = 'https://bill.co.id/riwayatBeta';
  List data = List();
  var nohp = '';
  var pin = '';
  ScrollController _scrollController = new ScrollController();
  ScrollController rollController = new ScrollController();
  bool isLoading = false;
  var page = 2;
  int i = 0;
  List items = new List();
  var tunggu = '';
  var user_role;
  var offset = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => new Home(usr: user_role)));
      },
      child: Scaffold(
          backgroundColor: Color(0xFFF4F7F8),
          appBar: SearchBar(
              searchHint: 'Cari berdasarkan nama',
              searchItem: SearchItem.action(
                builder: (_) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.07,
                      child: FittedBox(
                          child: Icon(Icons.search,
                              color: Color(0xFF777E81), size: 30))),
                ),
                gravity: SearchItemGravity.start,
              ),
              loader: QuerySetLoader<int>(
                querySetCall: (String query) {
                  List<int> cari = [];

                  for (int a = 0; a < items.length; a++) {
                    if (items[a]['name']
                        .toLowerCase()
                        .contains(query.toLowerCase())) {
                      cari.add(a);
                    }
                  }
                  // print(cari.toString());
                  return cari;
                },
                itemBuilder: (int a) {
                  // print('sini ' + o.toString());
                  // return Container(
                  //   width: 100,
                  //   height: 100,
                  //   color: Colors.red);
                  MoneyFormatterOutput fo = FlutterMoneyFormatter(
                          amount: items[a]['amount'],
                          settings: MoneyFormatterSettings(
                              thousandSeparator: '.', decimalSeparator: ','))
                      .output;
                  var tgl = DateFormat('d MMMM y', 'en_US')
                      .format(DateTime.parse(items[a]['payment_date']));
                  Uint8List bytes = base64.decode(items[a]['image']);
                  var month = DateFormat('MMMM', 'en_US')
                      .format(DateTime.parse(items[a]['payment_date']));
                  return Column(children: <Widget>[
                    a == 0
                        ? Container(
                            color: Color(0xFFFAFAFA),
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width * 0.05,
                                left: MediaQuery.of(context).size.width * 0.05,
                                right: MediaQuery.of(context).size.width * 0.05,
                                bottom:
                                    MediaQuery.of(context).size.width * 0.02),
                            alignment: Alignment.centerLeft,
                            child: DateFormat('MMMM', 'en_US').format(DateTime.parse(items[0]['payment_date'])) == DateFormat('MMMM', 'en_US').format(DateTime.now())
                                ? Container(
                                    child: Text('This Month',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF423838),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)))
                                : Container(
                                    child: Text(DateFormat('MMMM', 'en_US').format(DateTime.parse(items[0]['payment_date'])),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF423838),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600))))
                        : DateFormat('MMMM', 'en_US').format(DateTime.parse(items[a]['payment_date'])) != DateFormat('MMMM', 'en_US').format(DateTime.parse(items[a - 1]['payment_date']))
                            ? Container(
                                color: Color(0xFFF4F7F8),
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05, left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05, bottom: MediaQuery.of(context).size.width * 0.02),
                                alignment: Alignment.centerLeft,
                                child: Container(child: Text(DateFormat('MMMM', 'en_US').format(DateTime.parse(items[a]['payment_date'])), style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF423838), fontSize: 16, fontWeight: FontWeight.w600))))
                            : Container(),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                            vertical: MediaQuery.of(context).size.width * 0.04),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black12)),
                            color: Color(0xFFF4F7F8)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Row(children: <Widget>[
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.0095),
                                    child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Container(
                                            decoration: items[a]['image'] != ''
                                                ? BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image:
                                                            MemoryImage(bytes)))
                                                : BoxDecoration(
                                                    shape: BoxShape.circle),
                                            child: items[a]['image'] == ''
                                                ? CircleAvatar(
                                                    backgroundColor: items[a]
                                                                ['name'] !=
                                                            'Akun ini telah dihapus'
                                                        ? Color(0xFF0485AC)
                                                        : Color(0xFFF4F7F8),
                                                    child:
                                                        Center(child: items[a]['name'] != 'Bonus Top Up' ? items[a]['name'] != 'Akun ini telah dihapus' ? Container(width: MediaQuery.of(context).size.width * 0.04, child: FittedBox(child: Text(items[a]['name'] != '' ? items[a]['name'][0] : '', style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFFF4F7F8), fontSize: 20)))) : Container() : Image.asset('images/textbill.png', width: MediaQuery.of(context).size.width * 0.085, height: MediaQuery.of(context).size.width * 0.085)))
                                                : Container()))),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03),
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          child: Text(items[a]['name'],
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF6C6565)))),
                                      Container(
                                          child: Text(tgl,
                                              style: TextStyle(
                                                  color: Color(0xFF999494),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 13.0,
                                                  fontFamily: 'Montserrat')))
                                    ])
                              ])),
                              Container(
                                  child: Row(children: <Widget>[
                                Image(
                                    image: items[a]['transfer_type'] == 'in'
                                        ? AssetImage('images/plus.png')
                                        : AssetImage('images/min.png'),
                                    width: MediaQuery.of(context).size.width *
                                        0.08,
                                    height: MediaQuery.of(context).size.width *
                                        0.05),
                                fo.withoutFractionDigits.length < 10
                                    ? Container(
                                        child: Text(
                                            ' Rp ' + fo.withoutFractionDigits,
                                            style: TextStyle(
                                                color: Color(0xFF6C6565),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Montserrat')))
                                    : Container(
                                        child: Text(
                                            ' Rp ' + fo.compactNonSymbol,
                                            style: TextStyle(
                                                color: Color(0xFF6C6565),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Montserrat')))
                              ]))
                            ]))
                  ]);
                },
                loadOnEachChange: true,
                animateChanges: false,
              ),
              defaultBar: AppBar(
                  automaticallyImplyLeading: true,
                  title: Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text('Riwayat Transaksi',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF423838))))),
                  leading: Container(
                      // color: Colors.green,
                      // width: MediaQuery.of(context).size.width * 0.02,
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back,
                                  color: Color(0xFF777E81), size: 30),
                              onPressed: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => new Home(usr: user_role)))))),
                  backgroundColor: Color(0xFFF4F7F8),
                  elevation: 0.0,
                  actions: <Widget>[
                    // IconButton(
                    //     icon:
                    //         Icon(Icons.search, color: Color(0xFF777E81), size: 30),
                    //     onPressed: () {}),
                    IconButton(
                        icon: Image.asset('images/filter.png',
                            width: MediaQuery.of(context).size.width * 0.06,
                            height: MediaQuery.of(context).size.width * 0.06),
                        onPressed: () {
                          Navigator.of(context).push(Filter(
                              awal: widget.aw,
                              akhir: widget.ak,
                              topup: widget.to,
                              pembayaran: widget.pe,
                              debit: widget.db,
                              kredit: widget.kr));
                          print('''
                  awal: ${widget.aw},
                  akhir: ${widget.ak},
                  topup: ${widget.to},
                  pembayaran: ${widget.pe},
                  debit: ${widget.db},
                  kredit: ${widget.kr}
                  ''');
                        })
                  ])),
          body: tunggu == ''
              ? ListView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.05,
                            vertical: MediaQuery.of(context).size.width * 0.04),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  child: Row(
                                      children: <Widget>[
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300],
                                      highlightColor: Colors.grey[100],
                                      enabled: true,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: MediaQuery.of(context).size.height * 0.0095),
                                        child: AspectRatio(
                                            aspectRatio: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color : Colors.white,
                                                shape: BoxShape.circle))))),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width *0.03),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[300],
                                            highlightColor: Colors.grey[100],
                                            enabled: true,
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.02, 
                                              width: MediaQuery.of(context).size.width * 0.45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white))),
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[300],
                                            highlightColor: Colors.grey[100],
                                            enabled: true,
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.02,
                                              width: MediaQuery.of(context).size.width * 0.3,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white)))
                                        ])
                                  ])),
                              Container(
                                  child: Row(
                                      children: <Widget>[
                                        Shimmer.fromColors(
                                            baseColor: Colors.grey[300],
                                            highlightColor: Colors.grey[100],
                                            enabled: true,
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.02, 
                                              width: MediaQuery.of(context).size.width * 0.2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white))),
                                  ]))
                            ]));
                      })
              : items.isEmpty
                  ? Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: FittedBox(
                              child: Text('Tidak ada data yang tersedia',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 15,
                                      color: Color(0xFF423838))))))
                  : ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: CustomScrollView(
                          controller: _scrollController,
                          slivers: <Widget>[
                            SliverList(
                                delegate: SliverChildListDelegate([
                              Container(
                                child: ScrollConfiguration(
                                    behavior: MyBehavior(),
                                    child: ListView.builder(
                                        controller: rollController,
                                        padding: EdgeInsets.all(0.0),
                                        shrinkWrap: true,
                                        itemCount:
                                            data == null ? 0 : data.length + 1,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index == data.length) {
                                            if (items.length == data.length) {
                                            } else {
                                              return _buildProgressIndicator();
                                            }
                                          } else {
                                            MoneyFormatterOutput fo =
                                                FlutterMoneyFormatter(
                                                  amount: data[index]['amount'],
                                                  settings: MoneyFormatterSettings(
                                                    thousandSeparator: '.',
                                                    decimalSeparator: ','))
                                                .output;
                                            var tgl = DateFormat('d MMMM y', 'en_US')
                                            .format(DateTime.parse(data[index]['payment_date']));
                                            Uint8List bytes = base64
                                            .decode(data[index]['image']);
                                            var month = DateFormat('MMMM', 'en_US')
                                            .format(DateTime.parse(data[index]['payment_date']));

                                            return Column(children: <Widget>[
                                              index == 0
                                                  ? Container(
                                                      color: Color(0xFFFAFAFA),
                                                      width: MediaQuery.of(context).size.width,
                                                      padding: EdgeInsets.only(
                                                          top: MediaQuery.of(context).size.width * 0.05,
                                                          left: MediaQuery.of(context).size.width * 0.05,
                                                          right: MediaQuery.of(context).size.width * 0.05,
                                                          bottom: MediaQuery.of(context).size.width * 0.02),
                                                      alignment: Alignment.centerLeft,
                                                      child: DateFormat('MMMM', 'en_US').format(DateTime.parse(data[0]['payment_date'])) == 
                                                        DateFormat('MMMM', 'en_US').format(DateTime.now())
                                                          ? Container(
                                                            child: Text(
                                                              'This Month', 
                                                              style: TextStyle(
                                                                fontFamily: 'Montserrat', 
                                                                color: Color(0xFF423838), 
                                                                fontSize: 16, 
                                                                fontWeight: FontWeight.w600)))
                                                          : Container(
                                                            child: Text(DateFormat('MMMM', 'en_US')
                                                                .format(DateTime.parse(data[0]['payment_date'])),
                                                              style: TextStyle(
                                                                fontFamily: 'Montserrat', 
                                                                color: Color(0xFF423838), 
                                                                fontSize: 16, 
                                                                fontWeight: FontWeight.w600))))
                                                  : DateFormat('MMMM', 'en_US').
                                                      format(DateTime.parse(data[index]['payment_date'])) != 
                                                    DateFormat('MMMM', 'en_US')
                                                      .format(DateTime.parse(data[index - 1]['payment_date'])) 
                                                      ? Container(
                                                        color: Color(0xFFF4F7F8), 
                                                        width: MediaQuery.of(context).size.width, 
                                                        padding: EdgeInsets.only(
                                                          top: MediaQuery.of(context).size.width * 0.05, 
                                                          left: MediaQuery.of(context).size.width * 0.05, 
                                                          right: MediaQuery.of(context).size.width * 0.05, 
                                                          bottom: MediaQuery.of(context).size.width * 0.02), 
                                                        alignment: Alignment.centerLeft, 
                                                        child: Container(
                                                          child: Text(
                                                            DateFormat('MMMM', 'en_US')
                                                              .format(DateTime.parse(data[index]['payment_date'])), 
                                                            style: TextStyle(
                                                              fontFamily: 'Montserrat', 
                                                              color: Color(0xFF423838), 
                                                              fontSize: 16, 
                                                              fontWeight: FontWeight.w600)))) 
                                                      : Container(),
                                              Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: MediaQuery.of(context).size.width * 0.05,
                                                      vertical: MediaQuery.of(context).size.width * 0.04),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(
                                                              color: Colors.black12)),
                                                      color: Color(0xFFF4F7F8)),
                                                  width: MediaQuery.of(context).size.width,
                                                  height: MediaQuery.of(context).size.height * 0.12,
                                                  child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: <Widget>[
                                                        Container(
                                                            child: Row(
                                                                children: <Widget>[
                                                              Container(
                                                                  margin: EdgeInsets.symmetric(
                                                                      vertical: MediaQuery.of(context).size.height * 0.0095),
                                                                  child: AspectRatio(
                                                                      aspectRatio: 1,
                                                                      child: Container(
                                                                          decoration: data[index]['image'] != ''
                                                                              ? BoxDecoration(
                                                                                shape: BoxShape.circle, 
                                                                                image: DecorationImage(
                                                                                  fit: BoxFit.fill, 
                                                                                  image: MemoryImage(bytes)))
                                                                              : BoxDecoration(shape: BoxShape.circle),
                                                                          child: data[index]['image'] == '' 
                                                                          ? CircleAvatar(
                                                                            backgroundColor: data[index]['name'] != 'Akun ini telah dihapus' 
                                                                              ? Color(0xFF0485AC)
                                                                              : Color(0xFFF4F7F8), 
                                                                            child: Center(
                                                                              child: (data[index]['name'] != 'Bonus Top Up' && data[index]['name'] != 'Voucher') 
                                                                                ? data[index]['name'] != 'Akun ini telah dihapus' 
                                                                                  ? Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.04, 
                                                                                    child: FittedBox(
                                                                                      child: Text(data[index]['name'] != '' 
                                                                                          ? data[index]['name'][0] : '', 
                                                                                          style: TextStyle(
                                                                                            fontFamily: 'Montserrat', 
                                                                                            color: Color(0xFFF4F7F8), 
                                                                                            fontSize: 20)))) 
                                                                                  : Container() 
                                                                                : Image.asset('images/textbill.png', 
                                                                                    width: MediaQuery.of(context).size.width * 0.085, 
                                                                                    height: MediaQuery.of(context).size.width * 0.085))) 
                                                                          : Container()))),
                                                              SizedBox(
                                                                  width: MediaQuery.of(context).size.width *0.03),
                                                              Column(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: <Widget>[
                                                                    Container(
                                                                        child: Text(
                                                                            data[index]['name'],
                                                                            style: TextStyle(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Color(0xFF6C6565)))),
                                                                    Container(
                                                                        child: Text(tgl,
                                                                            style: TextStyle(
                                                                                color: Color(0xFF999494),
                                                                                fontWeight: FontWeight.normal,
                                                                                fontSize: 13.0,
                                                                                fontFamily: 'Montserrat')))
                                                                  ])
                                                            ])),
                                                        Container(
                                                            child: Row(
                                                                children: <Widget>[
                                                              Image(
                                                                  image: data[index]['transfer_type'] == 'in'
                                                                      ? AssetImage('images/plus.png')
                                                                      : AssetImage('images/min.png'),
                                                                  width: MediaQuery.of(context).size.width * 0.08,
                                                                  height: MediaQuery.of(context).size.width * 0.05),
                                                              fo.withoutFractionDigits.length <10
                                                                  ? Container(
                                                                      child: Text(' Rp ' + fo.withoutFractionDigits,
                                                                          style: TextStyle(
                                                                              color: Color(0xFF6C6565),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontFamily: 'Montserrat')))
                                                                  : Container(
                                                                      child: Text(' Rp ' + fo.compactNonSymbol,
                                                                          style: TextStyle(
                                                                              color: Color(0xFF6C6565),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontFamily: 'Montserrat')))
                                                            ]))
                                                      ]))
                                            ]);
                                          }
                                        })),
                              )
                            ]))
                          ]))),
    );
  }

  void makeRequest() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
    });

    final response =
        await http.post(url, body: {
          'username': nohp, 
          'password': pin,
          'page': offset.toString()});

    setState(() {
      tunggu = 'sudah';
      items = jsonDecode(response.body);
    });
    
    setState(() {
      for (int i = 0; i < 10 ; i++) {
        data.add(jsonDecode(response.body)[i]);
        setState(() {
          i = i;
        });
      }
      offset++;
      isLoading = false;
    });
  }

  // void loadMore() {
  //   if (!isLoading) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //   }

  //   setState(() {
  //     isLoading = false;
  //     for (i; i < 10 * page; i++) {
  //       data.add(items[i]);
  //       setState(() {
  //         i = i;
  //       });
  //     }
  //     page++;
  //   });
  // }

  // void loadMoreFilter() {
  //   if (!isLoading) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //   }

  //   setState(() {
  //     isLoading = false;
  //     for (i; i < 10 * page; i++) {
  //       data.add(items[i]);
  //       setState(() {
  //         i = i;
  //       });
  //     }
  //     page++;
  //   });
  // }

  void makeRequestFilter() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nohp = prefs.getString('nohp');
      pin = prefs.getString('pin');
    });

    var urlFilter = 'https://bill.co.id/filterBeta';
    final responseFilter = await http.post(urlFilter, body: {
      'username': nohp,
      'password': pin,
      'awal': widget.aw,
      'akhir': widget.ak,
      'topup': widget.to,
      'pembayaran': widget.pe,
      'debit': widget.db,
      'kredit': widget.kr,
      'page': offset.toString()
    });

    setState(() {
      tunggu = 'sudah';
      items = jsonDecode(responseFilter.body);
    });

    setState(() {
      for (int i = 0; i < 10; i++) {
        data.add(jsonDecode(responseFilter.body)[i]);
        setState(() {
          i = i;
        });
      }
      offset++;
      isLoading = false;
    });
  }

  @override
  void initState() {
    this.getUserRole();
    if (widget.tp == 'filter') {
      this.makeRequestFilter();
    } else {
      this.makeRequest();
    }
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (widget.tp == 'filter') {
          // this.loadMoreFilter();
          this.makeRequestFilter();
        } else {
          // this.loadMore();
          this.makeRequest();
        }
      }
    });
  }

  void getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user_role = prefs.getString('user_role');
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
